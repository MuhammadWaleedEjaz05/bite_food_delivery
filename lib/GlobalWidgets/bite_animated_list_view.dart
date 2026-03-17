import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BiteAnimatedListView extends StatelessWidget {
  final double offsetToArmed;
  final List<Widget> children;
  final Widget? header;
  const BiteAnimatedListView({
    super.key,
    required this.offsetToArmed,
    required this.children,
    this.header,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          surfaceTintColor: Theme.of(context).colorScheme.surface,
          collapsedHeight: offsetToArmed,
          floating: true,
          flexibleSpace: header ?? const SizedBox.shrink(),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          sliver: SliverList.list(children: children),
        ),
      ],
    );
  }
}
