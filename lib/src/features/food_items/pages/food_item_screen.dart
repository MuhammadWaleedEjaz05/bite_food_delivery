import 'package:bite_food_delivery/src/features/cart/cubits/cart_cubit/cart_cubit.dart';
import 'package:bite_food_delivery/src/features/favourites/cubits/favourite_cubit/favourite_cubit.dart';
import 'package:bite_food_delivery/src/shared/widgets/bite_app_bar.dart';
import 'package:bite_food_delivery/src/features/cart/models/cart_item_model.dart';
import 'package:bite_food_delivery/src/features/food_items/models/food_item_model.dart';
import 'package:bite_food_delivery/src/features/food_items/widgets/bite_flavor_list_tile.dart';
import 'package:bite_food_delivery/src/features/food_items/cubits/size_and_flavour_selection_cubit/size_and_flavour_selection_cubit_cubit.dart';
import 'package:bite_food_delivery/src/services/firebase/firebase_auth_conn.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodItemScreen extends StatelessWidget {
  const FoodItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ??
        {};
    final foodItem = args['foodItem'] as FoodItemModel;
    final restaurantName = args['restaurantName'] as String;
    return BlocProvider(
      create: (context) {
        final cubit = SizeAndFlavourSelectionCubitCubit();
        if (foodItem.sizes.isNotEmpty) {
          cubit.selectSize(foodItem.sizes.first);
        }
        return cubit;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: ListView(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32.r),
                bottomRight: Radius.circular(32.r),
              ),
              child: Container(
                height: 250.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(foodItem.images[0]),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(children: [_AppBarSection(foodItem)]),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
              ),
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  20.verticalSpace,
                  _FoodDescSection(foodItem, restaurantName),
                  20.verticalSpace,
                  _FoodSizeSelectionSection(foodItem),
                  30.verticalSpace,
                  _FlavorSelectionSection(foodItem),
                  150.verticalSpace,
                ],
              ),
            ),
          ],
        ),
        bottomSheet: _AddCardBottomSheet(foodItem),
      ),
    );
  }
}

class _AddCardBottomSheet extends StatelessWidget {
  final FoodItemModel foodItem;
  const _AddCardBottomSheet(this.foodItem);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      SizeAndFlavourSelectionCubitCubit,
      SizeAndFlavourSelectionCubitState
    >(
      builder: (context, selectionState) {
        return BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            CartItemModel? existingItem;
            String? cartID;

            if (state is CartLoaded) {
              cartID = state.cart.cartID;
              existingItem = state.cart.cartItems
                  .cast<CartItemModel?>()
                  .firstWhere(
                    (item) => item?.productID == foodItem.id,
                    orElse: () => null,
                  );
            }

            final isInCart = existingItem != null;
            final quantity = existingItem?.quantity ?? 1;

            return Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSecondaryFixed,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32.r),
                  topRight: Radius.circular(32.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    10.verticalSpace,
                    Row(
                      children: [
                        10.horizontalSpace,
                        Text(
                          'PKR ${foodItem.price.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const Spacer(),
                        if (isInCart)
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            child: Row(
                              spacing: 5.w,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  style: IconButton.styleFrom(
                                    backgroundColor: Colors.blueGrey.shade200,
                                    foregroundColor: Colors.white,
                                  ),
                                  onPressed: () {
                                    if (quantity > 1) {
                                      context.read<CartCubit>().updateCartItem(
                                        cartID: cartID!,
                                        cartItem: existingItem!.copyWith(
                                          quantity: quantity - 1,
                                        ),
                                      );
                                    }
                                  },
                                ),
                                Text(
                                  '$quantity',
                                  style: Theme.of(context).textTheme.titleLarge!
                                      .copyWith(color: Colors.white),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  style: IconButton.styleFrom(
                                    backgroundColor: Colors.blueGrey.shade200,
                                    foregroundColor: Colors.white,
                                  ),
                                  onPressed: () {
                                    context.read<CartCubit>().updateCartItem(
                                      cartID: cartID!,
                                      cartItem: existingItem!.copyWith(
                                        quantity: quantity + 1,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                    20.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              if (isInCart) {
                                context.read<CartCubit>().removeFromCart(
                                  cartID: cartID!,
                                  productID: foodItem.id,
                                );
                              } else {
                                context.read<CartCubit>().addToCart(
                                  userID: getCurrentUser()!.uid,
                                  cartItem: CartItemModel(
                                    productID: foodItem.id,
                                    product: foodItem.copyWith(
                                      sizes: foodItem.sizes,
                                    ),
                                    selectedFlavor:
                                        selectionState
                                            .selectedFlavours
                                            .isNotEmpty
                                        ? selectionState.selectedFlavours.join(
                                            ', ',
                                          )
                                        : null,
                                    selectedSize:
                                        selectionState.selectedSize.isNotEmpty
                                        ? selectionState.selectedSize
                                        : null,
                                    quantity: 1,
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              backgroundColor: isInCart
                                  ? Colors.red
                                  : Theme.of(context).colorScheme.primary,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                            child: Text(
                              isInCart
                                  ? AppLocalizations.of(context)!.removeFromCart
                                  : AppLocalizations.of(context)!.addToCart,
                              style: Theme.of(context).textTheme.headlineLarge!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _FlavorSelectionSection extends StatelessWidget {
  final FoodItemModel foodItem;
  const _FlavorSelectionSection(this.foodItem);

  @override
  Widget build(BuildContext context) {
    if (foodItem.flavors.isEmpty) return const SizedBox.shrink();
    final flavorKeys = foodItem.flavors.keys.toList();
    final flavorValues = foodItem.flavors.values.toList();
    return BlocBuilder<
      SizeAndFlavourSelectionCubitCubit,
      SizeAndFlavourSelectionCubitState
    >(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.chooseYourFlavor,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            10.verticalSpace,
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final flavor = flavorKeys[index];
                final flavorImage = flavorValues[index];
                final isSelected = state.selectedFlavours.contains(flavor);
                return BiteFlavorListTile(
                  title: flavor,
                  imageUrl: flavorImage,
                  isSelected: isSelected,
                  onChanged: (val) {
                    if (val == true) {
                      context
                          .read<SizeAndFlavourSelectionCubitCubit>()
                          .selectFlavour(flavor);
                    } else {
                      context
                          .read<SizeAndFlavourSelectionCubitCubit>()
                          .removeFlavour(flavor);
                    }
                  },
                );
              },
              separatorBuilder: (context, index) => 10.verticalSpace,
              itemCount: flavorKeys.length,
            ),
          ],
        );
      },
    );
  }
}

class _FoodSizeSelectionSection extends StatelessWidget {
  final FoodItemModel foodItem;
  const _FoodSizeSelectionSection(this.foodItem);

  @override
  Widget build(BuildContext context) {
    if (foodItem.sizes.isEmpty) return const SizedBox.shrink();
    return BlocBuilder<
      SizeAndFlavourSelectionCubitCubit,
      SizeAndFlavourSelectionCubitState
    >(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.chooseYourSize,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            10.verticalSpace,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Row(
                spacing: 10.w,
                children: foodItem.sizes.map((size) {
                  final isSelected = state.selectedSize == size;
                  return GestureDetector(
                    onTap: () {
                      context
                          .read<SizeAndFlavourSelectionCubitCubit>()
                          .selectSize(size);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 12.h,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(30.r),
                        border: Border.all(
                          color: isSelected
                              ? Theme.of(context).colorScheme.primary
                              : Colors.grey.shade300,
                          width: 1.5,
                        ),
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.primary.withValues(alpha: 0.3),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ]
                            : [],
                      ),
                      child: Text(
                        size,
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(
                              color: isSelected
                                  ? Colors.white
                                  : Theme.of(context).colorScheme.onSurface,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.w500,
                            ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _FoodDescSection extends StatelessWidget {
  final FoodItemModel foodItem;
  final String restaurantName;
  const _FoodDescSection(this.foodItem, this.restaurantName);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(foodItem.name, style: Theme.of(context).textTheme.displaySmall),
        5.verticalSpace,
        Text(
          restaurantName,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.normal,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        20.verticalSpace,
        10.verticalSpace,
        Text(
          foodItem.description,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

class _AppBarSection extends StatelessWidget {
  final FoodItemModel foodItem;
  const _AppBarSection(this.foodItem);

  @override
  Widget build(BuildContext context) {
    return BiteAppBar(
      backButton: true,
      isDarkMode: true,
      title: const SizedBox.shrink(),
      actions: [
        BlocBuilder<FavouriteCubit, FavouriteState>(
          builder: (context, state) {
            final isFavourite =
                state is FavouriteChanged &&
                    state.type == FavouriteType.foodItem &&
                    state.id == foodItem.id
                ? state.isFavourite
                : foodItem.isFavorite ?? false;
            return IconButton(
              onPressed: () {
                if (isFavourite) {
                  context.read<FavouriteCubit>().removeFoodItemFromFavourite(
                    foodItem.id,
                  );
                } else {
                  context.read<FavouriteCubit>().addFoodItemToFavourite(
                    foodItem.id,
                  );
                }
              },
              style: IconButton.styleFrom(
                foregroundColor: Colors.red,
                backgroundColor: Colors.grey.shade200,
              ),
              icon: Icon(
                isFavourite ? Icons.favorite : Icons.favorite_outline,
                size: 30.r,
              ),
            );
          },
        ),
        15.horizontalSpace,
      ],
    );
  }
}
