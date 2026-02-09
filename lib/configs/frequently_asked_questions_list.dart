import 'package:bite_food_delivery/Widgets/bite_menu_item.dart';
import 'package:flutter/material.dart';

List<BiteMenuItemModel> orderFAQs(BuildContext context) => [
  BiteMenuItemModel(
    leadingIcon: Icons.question_mark,
    leadingIconColor: Theme.of(context).primaryColor,
    title: 'How do I track my order?',
    onTap: () {},
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.question_mark,
    leadingIconColor: Theme.of(context).primaryColor,
    title: 'Can I cancel my order?',
    onTap: () {},
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.question_mark,
    leadingIconColor: Theme.of(context).primaryColor,
    title: 'What if my order is delayed?',
    onTap: () {},
  ),
];

List<BiteMenuItemModel> paymentsFAQs(BuildContext context) => [
  BiteMenuItemModel(
    leadingIcon: Icons.question_mark,
    leadingIconColor: Theme.of(context).primaryColor,
    title: 'What payment methods are accepted?',
    onTap: () {},
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.question_mark,
    leadingIconColor: Theme.of(context).primaryColor,
    title: 'Is it safe to use my credit/debit card on Bite?',
    onTap: () {},
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.question_mark,
    leadingIconColor: Theme.of(context).primaryColor,
    title: 'Can I use multiple payment methods for one order?',
    onTap: () {},
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.question_mark,
    leadingIconColor: Theme.of(context).primaryColor,
    title: 'What should I do if a payment fails?',
    onTap: () {},
  ),
];

List<BiteMenuItemModel> deliveryFAQs(BuildContext context) => [
  BiteMenuItemModel(
    leadingIcon: Icons.question_mark,
    leadingIconColor: Theme.of(context).primaryColor,
    title: 'What are your delivery hours?',
    onTap: () {},
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.question_mark,
    leadingIconColor: Theme.of(context).primaryColor,
    title: 'Do you charge a delivery fee?',
    onTap: () {},
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.question_mark,
    leadingIconColor: Theme.of(context).primaryColor,
    title: 'Do you deliver to my location?',
    onTap: () {},
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.question_mark,
    leadingIconColor: Theme.of(context).primaryColor,
    title: 'Can I schedule a delivery for a later time?',
    onTap: () {},
  ),
];
