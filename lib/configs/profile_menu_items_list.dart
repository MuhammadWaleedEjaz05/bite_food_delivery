import 'package:bite_food_delivery/Widgets/bite_menu_item.dart';
import 'package:flutter/material.dart';

List<BiteMenuItemModel> pInfoList(BuildContext context) => [
  BiteMenuItemModel(
    leadingIcon: Icons.person_outline,
    leadingIconColor: Colors.deepOrange,
    title: 'Personal Info',
    onTap: () => Navigator.pushNamed(context, '/person_info_screen'),
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.location_on_outlined,
    leadingIconColor: Colors.blue,
    title: 'Address',
    onTap: () => Navigator.pushNamed(context, '/address_screen'),
  ),
];

List<BiteMenuItemModel> pAppList(BuildContext context) => [
  BiteMenuItemModel(
    leadingIcon: Icons.shopping_bag_outlined,
    leadingIconColor: Colors.lightBlue,
    title: 'Cart',
    onTap: () {},
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.favorite_border,
    leadingIconColor: Colors.pink,
    title: 'Favorites',
    onTap: () {},
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.notifications_none,
    leadingIconColor: Colors.purple,
    title: 'Notifications',
    onTap: () {},
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.credit_card_off_outlined,
    leadingIconColor: Colors.blue,
    title: 'Payment Method',
    onTap: () {},
  ),
];

List<BiteMenuItemModel> pSupportList(BuildContext context) => [
  BiteMenuItemModel(
    leadingIcon: Icons.support_outlined,
    leadingIconColor: Colors.red,
    title: 'FAQs',
    onTap: () {},
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.reviews,
    leadingIconColor: Colors.cyan,
    title: 'Reviews',
    onTap: () {},
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.settings_outlined,
    leadingIconColor: Colors.green,
    title: 'Settings',
    onTap: () {},
  ),
];

List<BiteMenuItemModel> personalInfoList(BuildContext context) => [
  BiteMenuItemModel(
    leadingIcon: Icons.person_outline,
    leadingIconColor: Colors.deepOrange,
    title: 'Full Name',
    subtitle: 'Waleed Ejaz',
    onTap: () {},
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.email_outlined,
    leadingIconColor: Colors.blue,
    title: 'Email',
    subtitle: 'm.waleedejaz2003@gmail.com',
    onTap: () {},
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.phone_outlined,
    leadingIconColor: Colors.green,
    title: 'Phone',
    subtitle: '+92 3009633165',
    onTap: () {},
  ),
];
