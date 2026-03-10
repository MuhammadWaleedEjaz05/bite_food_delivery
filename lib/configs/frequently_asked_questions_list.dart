import 'package:bite_food_delivery/GlobalWidgets/bite_menu_item.dart';
import 'package:bite_food_delivery/generated/l10n.dart';
import 'package:flutter/material.dart';

List<BiteMenuItemModel> orderFAQs(BuildContext context) => [
  BiteMenuItemModel(
    leadingIcon: Icons.question_mark,
    leadingIconColor: Colors.deepOrange,
    title: S.of(context).howDoITrackMyOrder,
    onTap: () {},
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.question_mark,
    leadingIconColor: Colors.deepOrange,
    title: S.of(context).canICancelMyOrder,
    onTap: () {},
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.question_mark,
    leadingIconColor: Colors.deepOrange,
    title: S.of(context).whatIfMyOrderIsDelayed,
    onTap: () {},
  ),
];

List<BiteMenuItemModel> paymentsFAQs(BuildContext context) => [
  BiteMenuItemModel(
    leadingIcon: Icons.question_mark,
    leadingIconColor: Colors.deepOrange,
    title: S.of(context).whatPaymentMethodsAreAccepted,
    onTap: () {},
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.question_mark,
    leadingIconColor: Colors.deepOrange,
    title: S.of(context).isItSafeToUseMyCreditdebitCardOnBite,
    onTap: () {},
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.question_mark,
    leadingIconColor: Colors.deepOrange,
    title: S.of(context).canIUseMultiplePaymentMethodsForOneOrder,
    onTap: () {},
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.question_mark,
    leadingIconColor: Colors.deepOrange,
    title: S.of(context).whatShouldIDoIfAPaymentFails,
    onTap: () {},
  ),
];

List<BiteMenuItemModel> deliveryFAQs(BuildContext context) => [
  BiteMenuItemModel(
    leadingIcon: Icons.question_mark,
    leadingIconColor: Colors.deepOrange,
    title: S.of(context).whatAreYourDeliveryHours,
    onTap: () {},
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.question_mark,
    leadingIconColor: Colors.deepOrange,
    title: S.of(context).doYouChargeADeliveryFee,
    onTap: () {},
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.question_mark,
    leadingIconColor: Colors.deepOrange,
    title: S.of(context).doYouDeliverToMyLocation,
    onTap: () {},
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.question_mark,
    leadingIconColor: Colors.deepOrange,
    title: S.of(context).canIScheduleADeliveryForALaterTime,
    onTap: () {},
  ),
];
