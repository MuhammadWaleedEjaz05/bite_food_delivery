import 'package:bite_food_delivery/src/shared/widgets/bite_menu_item.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

List<BiteMenuItemModel> orderFAQs(BuildContext context) => [
  BiteMenuItemModel(
    leadingIcon: Icons.question_mark,
    leadingIconColor: Theme.of(context).colorScheme.primary,
    title: AppLocalizations.of(context)!.howDoITrackMyOrder,
    onTap: () {},
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.question_mark,
    leadingIconColor: Theme.of(context).colorScheme.primary,
    title: AppLocalizations.of(context)!.canICancelMyOrder,
    onTap: () {},
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.question_mark,
    leadingIconColor: Theme.of(context).colorScheme.primary,
    title: AppLocalizations.of(context)!.whatIfMyOrderIsDelayed,
    onTap: () {},
  ),
];

List<BiteMenuItemModel> paymentsFAQs(BuildContext context) => [
  BiteMenuItemModel(
    leadingIcon: Icons.question_mark,
    leadingIconColor: Theme.of(context).colorScheme.primary,
    title: AppLocalizations.of(context)!.whatPaymentMethodsAreAccepted,
    onTap: () {},
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.question_mark,
    leadingIconColor: Theme.of(context).colorScheme.primary,
    title: AppLocalizations.of(context)!.isItSafeToUseMyCreditdebitCardOnBite,
    onTap: () {},
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.question_mark,
    leadingIconColor: Theme.of(context).colorScheme.primary,
    title: AppLocalizations.of(
      context,
    )!.canIUseMultiplePaymentMethodsForOneOrder,
    onTap: () {},
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.question_mark,
    leadingIconColor: Theme.of(context).colorScheme.primary,
    title: AppLocalizations.of(context)!.whatShouldIDoIfAPaymentFails,
    onTap: () {},
  ),
];

List<BiteMenuItemModel> deliveryFAQs(BuildContext context) => [
  BiteMenuItemModel(
    leadingIcon: Icons.question_mark,
    leadingIconColor: Theme.of(context).colorScheme.primary,
    title: AppLocalizations.of(context)!.whatAreYourDeliveryHours,
    onTap: () {},
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.question_mark,
    leadingIconColor: Theme.of(context).colorScheme.primary,
    title: AppLocalizations.of(context)!.doYouChargeADeliveryFee,
    onTap: () {},
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.question_mark,
    leadingIconColor: Theme.of(context).colorScheme.primary,
    title: AppLocalizations.of(context)!.doYouDeliverToMyLocation,
    onTap: () {},
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.question_mark,
    leadingIconColor: Theme.of(context).colorScheme.primary,
    title: AppLocalizations.of(context)!.canIScheduleADeliveryForALaterTime,
    onTap: () {},
  ),
];
