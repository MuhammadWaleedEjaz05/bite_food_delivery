import 'package:bite_food_delivery/Cubits/CreditCardCubit/credit_card_cubit.dart';
import 'package:bite_food_delivery/Cubits/CreditCardCubit/credit_card_type_selector_cubit.dart';
import 'package:bite_food_delivery/Cubits/PaymentCubit/payment_method_selector_cubit.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:bite_food_delivery/Models/credit_card_model.dart';
import 'package:bite_food_delivery/Screens/PaymentPage/Widgets/bite_credit_card_tile.dart';
import 'package:bite_food_delivery/Screens/PaymentPage/Widgets/bite_payment_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: _AppSection(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            20.verticalSpace,
            _PaymentSelectionSection(),
            20.verticalSpace,
            _CreditCardListSection(),
            Spacer(),
            _AddCardSection(),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}

class _AddCardSection extends StatelessWidget {
  const _AddCardSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/add_card_screen');
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              textStyle: Theme.of(context).textTheme.headlineLarge,
            ),
            child: Text('Add New Card'),
          ),
        ),
      ],
    );
  }
}

class _CreditCardListSection extends StatelessWidget {
  const _CreditCardListSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreditCardTypeSelectorCubit, CreditCardType>(
      builder: (context, type) {
        return BlocConsumer<CreditCardCubit, CreditCardState>(
          listener: (context, state) {
            if (state is CreditCardError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Error: ${state.error}')));
            } else if (state is CreditCardAdded) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Credit card Added Successfully')),
              );
            } else if (state is CreditCardDeleted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Credit card Deleted Successfully')),
              );
            }
          },
          builder: (context, state) {
            if (state is CreditCardLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CreditCardLoaded) {
              final creditCardsList = state.creditCardList;
              final filteredCards = creditCardsList
                  .where((card) => card.cardType == type)
                  .toList();
              if (type == CreditCardType.onCash) {
                return Container(
                  padding: EdgeInsets.all(20.r),
                  height: 250.h,
                  width: 300.w,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(25),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Cash on Delivery selected. No credit cards to display.',
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              } else {
                if (filteredCards.isEmpty) {
                  return Container(
                    padding: EdgeInsets.all(20.r),
                    height: 250.h,
                    width: 300.w,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(25),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'No credit cards found. Please add a card.',
                        style: Theme.of(context).textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                } else {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: filteredCards.length,
                    separatorBuilder: (context, index) => 10.verticalSpace,
                    itemBuilder: (context, index) =>
                        BiteCreditCardTile(creditCard: filteredCards[index]),
                  );
                }
              }
            } else if (state is CreditCardError) {
              return Center(
                child: Text('Failed to load credit cards: ${state.error}'),
              );
            } else {
              return Center(
                child: Text('Unexpected state: ${state.runtimeType}'),
              );
            }
          },
        );
      },
    );
  }
}

class _PaymentSelectionSection extends StatelessWidget {
  const _PaymentSelectionSection();

  @override
  Widget build(BuildContext context) {
    final paymentMethods = [
      'assets/svgs/Cash.svg',
      'assets/svgs/Visa.svg',
      'assets/svgs/Mastercard.svg',
    ];
    final List<CreditCardType> creditCardTypes = [
      CreditCardType.onCash,
      CreditCardType.visa,
      CreditCardType.mastercard,
    ];
    return SizedBox(
      height: 90.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: paymentMethods
            .map(
              (e) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: GestureDetector(
                  onLongPress: () {
                    context
                        .read<PaymentMethodSelectorCubit>()
                        .selectPaymentMethod(null, CreditCardType.onCash);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Cash on Delivery selected')),
                    );
                    Navigator.pop(context);
                  },
                  onTap: () => context
                      .read<CreditCardTypeSelectorCubit>()
                      .selectCardType(
                        creditCardTypes[paymentMethods.indexOf(e)],
                      ),
                  child: BitePaymentBlock(
                    svgPath: e,
                    isSelected:
                        context.watch<CreditCardTypeSelectorCubit>().state ==
                        creditCardTypes[paymentMethods.indexOf(e)],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _AppSection extends StatelessWidget implements PreferredSizeWidget {
  const _AppSection();
  @override
  Size get preferredSize => Size.fromHeight(100.h);
  @override
  Widget build(BuildContext context) {
    return BiteAppBar(
      backButton: true,
      title: Text(
        'Payment Method',
        style: GoogleFonts.sen(
          fontSize: Theme.of(context).textTheme.displaySmall!.fontSize,
          fontWeight: Theme.of(context).textTheme.displaySmall!.fontWeight,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      actions: [],
    );
  }
}
