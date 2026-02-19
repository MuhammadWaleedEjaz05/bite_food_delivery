import 'package:bite_food_delivery/Cubits/UserAuthCubit/user_auth_cubit.dart';
import 'package:bite_food_delivery/Screens/PersonInfoPage/Widgets/bite_edit_profile_modal.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    onTap: () => Navigator.pushNamed(context, '/cart_screen'),
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.history_rounded,
    leadingIconColor: Colors.green,
    title: 'Order History',
    onTap: () => Navigator.pushNamed(context, '/order_history_screen'),
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.favorite_border,
    leadingIconColor: Colors.pink,
    title: 'Favorites',
    onTap: () => Navigator.pushNamed(context, '/favourite'),
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.notifications_none,
    leadingIconColor: Colors.purple,
    title: 'Notifications',
    onTap: () => Navigator.pushNamed(context, '/notification'),
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.credit_card_off_outlined,
    leadingIconColor: Colors.blue,
    title: 'Payment Method',
    onTap: () => Navigator.pushNamed(context, '/payment_screen'),
  ),
];

List<BiteMenuItemModel> pSupportList(BuildContext context) => [
  BiteMenuItemModel(
    leadingIcon: Icons.support_outlined,
    leadingIconColor: Colors.red,
    title: 'FAQs',
    onTap: () => Navigator.pushNamed(context, '/faq_screen'),
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.settings_outlined,
    leadingIconColor: Colors.green,
    title: 'Settings',
    onTap: () => Navigator.pushNamed(context, '/setting_screen'),
  ),
];

List<BiteMenuItemModel> personalInfoList(BuildContext context) => [
  BiteMenuItemModel(
    leadingIcon: Icons.person_outline,
    leadingIconColor: Colors.deepOrange,
    title: 'Full Name',
    subtitle: BlocProvider.of<UserAuthCubit>(context).state is UserLoggedIn
        ? (BlocProvider.of<UserAuthCubit>(context).state as UserLoggedIn)
              .user
              .fullName
        : 'Guest User',
    onTap: () {
      showDialog(
        context: context,
        builder: (context) =>
            Dialog(child: BiteEditProfileModal(title: 'Full Name')),
      );
    },
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.email_outlined,
    leadingIconColor: Colors.blue,
    title: 'Email',
    subtitle: BlocProvider.of<UserAuthCubit>(context).state is UserLoggedIn
        ? (BlocProvider.of<UserAuthCubit>(context).state as UserLoggedIn)
              .user
              .email
        : '',
    onTap: () {
      showDialog(
        context: context,
        builder: (context) =>
            Dialog(child: BiteEditProfileModal(title: 'Email')),
      );
    },
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.phone_outlined,
    leadingIconColor: Colors.green,
    title: 'Phone',
    subtitle: BlocProvider.of<UserAuthCubit>(context).state is UserLoggedIn
        ? (BlocProvider.of<UserAuthCubit>(context).state as UserLoggedIn)
                  .user
                  .phoneNumber ??
              ''
        : '' ,
    onTap: () {
      showDialog(
        context: context,
        builder: (context) =>
            Dialog(child: BiteEditProfileModal(title: 'Phone Number')),
      );
    },
  ),
];
