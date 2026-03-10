import 'package:bite_food_delivery/Cubits/CreditCardCubit/credit_card_cubit.dart';
import 'package:bite_food_delivery/Cubits/PaymentCubit/payment_method_selector_cubit.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:bite_food_delivery/Models/credit_card_model.dart';
import 'package:bite_food_delivery/configs/firebase_auth_conn.dart';
import 'package:bite_food_delivery/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: _AppSection(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              children: [
                20.verticalSpace,
                _PaymentMethodSection(),
                25.verticalSpace,
                _SavedCardsSection(),
                25.verticalSpace,
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: _AddCardButton(),
          ),
          20.verticalSpace,
        ],
      ),
    );
  }
}

class _PaymentMethodSection extends StatelessWidget {
  const _PaymentMethodSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeader(
          icon: Icons.payment_outlined,
          title: S.of(context).selectPaymentMethod,
        ),
        12.verticalSpace,
        BlocBuilder<PaymentMethodSelectorCubit, CreditCardModel>(
          builder: (context, selectedCard) {
            final selectedType = selectedCard.cardType;
            return Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSecondaryFixed,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                children: [
                  _PaymentMethodTile(
                    svgPath: 'assets/svgs/Cash.svg',
                    label: S.of(context).cashOnDelivery,
                    subtitle: S.of(context).payWhenYourOrderArrives,
                    isSelected: selectedType == CreditCardType.onCash,
                    onTap: () {
                      context
                          .read<PaymentMethodSelectorCubit>()
                          .selectPaymentMethod(null, CreditCardType.onCash);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(S.of(context).cashOnDeliverySelected),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                      Navigator.pop(context);
                    },
                  ),
                  Divider(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSecondaryFixedVariant,
                    height: 1,
                    indent: 15.w,
                    endIndent: 15.w,
                  ),
                  _PaymentMethodTile(
                    svgPath: 'assets/svgs/Visa.svg',
                    label: S.of(context).visa,
                    subtitle: S.of(context).selectFromYourSavedVisaCards,
                    isSelected: selectedType == CreditCardType.visa,
                    onTap: () => _selectCardType(context, CreditCardType.visa),
                  ),
                  Divider(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSecondaryFixedVariant,
                    height: 1,
                    indent: 15.w,
                    endIndent: 15.w,
                  ),
                  _PaymentMethodTile(
                    svgPath: 'assets/svgs/Mastercard.svg',
                    label: S.of(context).mastercard,
                    subtitle: S.of(context).selectFromYourSavedMastercards,
                    isSelected: selectedType == CreditCardType.mastercard,
                    onTap: () =>
                        _selectCardType(context, CreditCardType.mastercard),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  void _selectCardType(BuildContext context, CreditCardType type) {
    final cards = context.read<CreditCardCubit>().state;
    if (cards is CreditCardLoaded) {
      final matching = cards.creditCardList
          .where((c) => c.cardType == type)
          .toList();
      if (matching.isNotEmpty) {
        context.read<PaymentMethodSelectorCubit>().selectPaymentMethod(
          matching.first,
          type,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Card ending in ${matching.first.last4} selected'),
            duration: const Duration(seconds: 2),
          ),
        );
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('No ${type.name} cards saved. Add one first.'),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    }
  }
}

class _PaymentMethodTile extends StatelessWidget {
  final String svgPath;
  final String label;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  const _PaymentMethodTile({
    required this.svgPath,
    required this.label,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                color: isSelected
                    ? primaryColor.withAlpha(25)
                    : Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: SvgPicture.asset(svgPath, height: 28.h, width: 28.w),
            ),
            14.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  3.verticalSpace,
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ],
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              height: 24.r,
              width: 24.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? primaryColor : Colors.transparent,
                border: Border.all(
                  color: isSelected ? primaryColor : Colors.grey.shade400,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Icon(Icons.check, size: 16.r, color: Colors.white)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

class _SavedCardsSection extends StatelessWidget {
  const _SavedCardsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeader(
          icon: Icons.credit_card_rounded,
          title: S.of(context).savedCards,
        ),
        12.verticalSpace,
        BlocConsumer<CreditCardCubit, CreditCardState>(
          listener: (context, state) {
            if (state is CreditCardError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(S.of(context).errorStatemessage(state.error)),
                ),
              );
            } else if (state is CreditCardAdded) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(S.of(context).creditCardAddedSuccessfully),
                ),
              );
            } else if (state is CreditCardDeleted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(S.of(context).creditCardDeletedSuccessfully),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is CreditCardLoading) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 40.h),
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is CreditCardLoaded) {
              final cards = state.creditCardList;
              if (cards.isEmpty) {
                return _EmptyCardPlaceholder();
              }
              return Container(
                padding: EdgeInsets.all(12.r),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSecondaryFixed,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: cards.length,
                  separatorBuilder: (_, __) => Divider(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSecondaryFixedVariant,
                    height: 1,
                    indent: 15.w,
                    endIndent: 15.w,
                  ),
                  itemBuilder: (context, index) =>
                      _SavedCardTile(creditCard: cards[index]),
                ),
              );
            } else if (state is CreditCardError) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 40.h),
                  child: Text(S.of(context).failedToLoadCards),
                ),
              );
            }
            return SizedBox.shrink();
          },
        ),
      ],
    );
  }
}

class _EmptyCardPlaceholder extends StatelessWidget {
  const _EmptyCardPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondaryFixed,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          Icon(
            Icons.credit_card_off_rounded,
            size: 48.r,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          12.verticalSpace,
          Text(
            S.of(context).noSavedCardsYet,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          6.verticalSpace,
          Text(
            S.of(context).addACardBelowToGetStarted,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _SavedCardTile extends StatelessWidget {
  final CreditCardModel creditCard;
  const _SavedCardTile({required this.creditCard});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 12.h),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: primaryColor.withAlpha(15),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: SvgPicture.asset(
              switch (creditCard.cardType) {
                CreditCardType.visa => 'assets/svgs/Visa.svg',
                CreditCardType.mastercard => 'assets/svgs/Mastercard.svg',
                CreditCardType.onCash => 'assets/svgs/Cash.svg',
                CreditCardType.paypal => 'assets/svgs/Paypal.svg',
              },
              height: 24.h,
              width: 36.w,
            ),
          ),
          14.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '**** **** **** ${creditCard.last4}',
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w600),
                ),
                3.verticalSpace,
                Text(
                  '${creditCard.cardHolderName}  •  ${creditCard.expiryDate}',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<PaymentMethodSelectorCubit, CreditCardModel>(
            builder: (context, selectedCard) {
              final isSelected =
                  selectedCard.paymentMethodId == creditCard.paymentMethodId &&
                  creditCard.paymentMethodId.isNotEmpty;
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!isSelected)
                    _SmallActionButton(
                      icon: Icons.check_rounded,
                      color: primaryColor,
                      onTap: () {
                        context
                            .read<PaymentMethodSelectorCubit>()
                            .selectPaymentMethod(
                              creditCard,
                              creditCard.cardType,
                            );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              S
                                  .of(context)
                                  .cardEndingInCreditcardlast4Selected(
                                    creditCard.last4,
                                  ),
                            ),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                        Navigator.pop(context);
                      },
                    ),
                  if (isSelected)
                    Container(
                      padding: EdgeInsets.all(6.r),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.check_circle_rounded,
                        size: 20.r,
                        color: Colors.green,
                      ),
                    ),
                  8.horizontalSpace,
                  _SmallActionButton(
                    icon: Icons.delete_outline_rounded,
                    color: Colors.red,
                    onTap: () {
                      context
                          .read<PaymentMethodSelectorCubit>()
                          .selectPaymentMethod(null, CreditCardType.onCash);
                      context.read<CreditCardCubit>().deleteCreditCard(
                        getCurrentUser()!.uid,
                        creditCard.paymentMethodId,
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _SmallActionButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _SmallActionButton({
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20.r),
      child: Container(
        padding: EdgeInsets.all(6.r),
        decoration: BoxDecoration(
          color: color.withAlpha(20),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 20.r, color: color),
      ),
    );
  }
}

class _AddCardButton extends StatelessWidget {
  const _AddCardButton();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/add_card_screen');
            },
            icon: Icon(Icons.add_rounded, size: 22.r),
            label: Text(S.of(context).addNewCard),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.r),
              ),
              textStyle: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
        ),
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final IconData icon;
  final String title;

  const _SectionHeader({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.primary, size: 22.r),
        8.horizontalSpace,
        Text(title, style: Theme.of(context).textTheme.titleMedium),
      ],
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
        S.of(context).paymentMethod,
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
