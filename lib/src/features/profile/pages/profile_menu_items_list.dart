import 'package:bite_food_delivery/src/features/authentication/cubits/user_auth_cubit/user_auth_cubit.dart';
import 'package:bite_food_delivery/src/features/profile/widgets/bite_edit_profile_modal.dart';
import 'package:bite_food_delivery/src/shared/widgets/bite_menu_item.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BiteMenuItemModel> pInfoList(BuildContext context) => [
  BiteMenuItemModel(
    leadingIcon: Icons.person_outline,
    leadingIconColor: Colors.deepOrange,
    title: AppLocalizations.of(context)!.personalInfo,
    onTap: () => Navigator.pushNamed(context, '/person_info_screen'),
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.location_on_outlined,
    leadingIconColor: Colors.blue,
    title: AppLocalizations.of(context)!.address,
    onTap: () => Navigator.pushNamed(context, '/address_screen'),
  ),
];

List<BiteMenuItemModel> pAppList(BuildContext context) => [
  BiteMenuItemModel(
    leadingIcon: Icons.shopping_bag_outlined,
    leadingIconColor: Colors.lightBlue,
    title: AppLocalizations.of(context)!.cart,
    onTap: () => Navigator.pushNamed(context, '/cart_screen'),
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.history_rounded,
    leadingIconColor: Colors.green,
    title: AppLocalizations.of(context)!.orderHistory,
    onTap: () => Navigator.pushNamed(context, '/order_history_screen'),
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.favorite_border,
    leadingIconColor: Colors.pink,
    title: AppLocalizations.of(context)!.favorites,
    onTap: () => Navigator.pushNamed(context, '/favourite'),
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.notifications_none,
    leadingIconColor: Colors.purple,
    title: AppLocalizations.of(context)!.notifications,
    onTap: () => Navigator.pushNamed(context, '/notification'),
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.credit_card_off_outlined,
    leadingIconColor: Colors.blue,
    title: AppLocalizations.of(context)!.paymentMethod,
    onTap: () => Navigator.pushNamed(context, '/payment_screen'),
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.rate_review_outlined,
    leadingIconColor: Colors.orange,
    title: AppLocalizations.of(context)!.reviews,
    onTap: () => Navigator.pushNamed(context, '/my_reviews_screen'),
  ),
];

List<BiteMenuItemModel> pSupportList(BuildContext context) => [
  BiteMenuItemModel(
    leadingIcon: Icons.support_outlined,
    leadingIconColor: Colors.red,
    title: AppLocalizations.of(context)!.faqs,
    onTap: () => Navigator.pushNamed(context, '/faq_screen'),
  ),
  BiteMenuItemModel(
    leadingIcon: Icons.settings_outlined,
    leadingIconColor: Colors.green,
    title: AppLocalizations.of(context)!.settings,
    onTap: () => Navigator.pushNamed(context, '/setting_screen'),
  ),
];

List<BiteMenuItemModel> personalInfoList(BuildContext context) => [
  BiteMenuItemModel(
    leadingIcon: Icons.person_outline,
    leadingIconColor: Colors.deepOrange,
    title: AppLocalizations.of(context)!.fullName,
    subtitle: context.read<UserAuthCubit>().state is UserLoggedIn
        ? (context.read<UserAuthCubit>().state as UserLoggedIn).user.fullName
        : AppLocalizations.of(context)!.guestUser,
    onTap: () {
      showDialog(
        context: context,
        builder: (context) =>
            const Dialog(child: BiteEditProfileModal(title: 'Full Name')),
      );
    },
  ),

  BiteMenuItemModel(
    leadingIcon: Icons.phone_outlined,
    leadingIconColor: Colors.green,
    title: AppLocalizations.of(context)!.phone,
    subtitle: context.read<UserAuthCubit>().state is UserLoggedIn
        ? (context.read<UserAuthCubit>().state as UserLoggedIn)
                  .user
                  .phoneNumber ??
              ''
        : '',
    onTap: () {
      showDialog(
        context: context,
        builder: (context) => Dialog(
          child: BiteEditProfileModal(
            title: AppLocalizations.of(context)!.phoneNumber,
          ),
        ),
      );
    },
  ),
];
