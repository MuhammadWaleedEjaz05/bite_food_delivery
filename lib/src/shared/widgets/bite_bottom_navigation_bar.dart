import 'package:bite_food_delivery/src/shared/cubits/bottom_navigation_selection/bottom_navigation_selector_cubit.dart';
import 'package:bite_food_delivery/src/core/constants/screen_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class BiteBottomItemModel {
  final IconData icon;
  final IconData selectedIcon;
  final String title;
  final Widget page;

  BiteBottomItemModel({
    required this.icon,
    required this.selectedIcon,
    required this.title,
    required this.page,
  });
}

class BiteBottomNavigationBar extends StatelessWidget {
  final PageController pageController;
  const BiteBottomNavigationBar({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      BottomNavigationSelectorCubit,
      BottomNavigationSelectorState,
      int
    >(
      selector: (state) {
        return state is BottomNavigationSelectorChanged
            ? state.selectedIndex
            : 0;
      },
      builder: (context, index) {
        return StylishBottomBar(
          currentIndex: index,
          onTap: (value) {
            if (value == index + 1 || value == index - 1) {
              pageController.animateToPage(
                value,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeIn,
              );
            } else {
              pageController.jumpToPage(value);
            }
            context.read<BottomNavigationSelectorCubit>().changeSelectedIndex(
              value,
            );
          },
          backgroundColor: Theme.of(context).colorScheme.surface,
          items: screenList(context)
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
      selectedColor: Theme.of(context).colorScheme.primary,
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}
