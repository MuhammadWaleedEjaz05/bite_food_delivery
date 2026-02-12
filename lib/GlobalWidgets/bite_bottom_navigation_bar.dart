import 'package:bite_food_delivery/Cubits/BottomNavigationSelection/bottom_navigation_selector_cubit.dart';
import 'package:bite_food_delivery/configs/screen_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class BiteBottomItemModel {
  final IconData icon;
  final IconData selectedIcon;
  final String title;
  final Widget? page;

  BiteBottomItemModel({
    required this.icon,
    required this.selectedIcon,
    required this.title,
    this.page,
  });
}

class BiteBottomNavigationBar extends StatelessWidget {
  const BiteBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      BottomNavigationSelectorCubit,
      BottomNavigationSelectorState
    >(
      builder: (context, state) {
        return StylishBottomBar(
          currentIndex: state is BottomNavigationSelectorChanged
              ? state.selectedIndex
              : 0,
          onTap: (value) => context
              .read<BottomNavigationSelectorCubit>()
              .changeSelectedIndex(value),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          items: screenList
              .map<BottomBarItem>(
                (BiteBottomItemModel e) => _biteBottomBarItem(
                  context,
                  e.title,
                  e.icon,
                  e.selectedIcon,
                ),
              )
              .toList(),
          option: BubbleBarOptions(
            padding: EdgeInsets.all(5.r),
            barStyle: BubbleBarStyle.vertical,
            bubbleFillStyle: BubbleFillStyle.fill,
            opacity: 0.2,
          ),
        );
      },
    );
  }

  BottomBarItem _biteBottomBarItem(
    BuildContext context,
    String title,
    IconData icon,
    IconData selectedIcon,
  ) {
    return BottomBarItem(
      icon: Icon(icon),
      selectedIcon: Icon(selectedIcon),
      title: Text(title),
      selectedColor: Theme.of(context).primaryColor,
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
