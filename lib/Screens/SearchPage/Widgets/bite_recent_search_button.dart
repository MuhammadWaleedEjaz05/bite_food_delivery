import 'package:bite_food_delivery/Cubits/RecentSearchesCubit/recent_searches_cubit.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BiteRecentSearchButton extends StatelessWidget {
  final String search;
  const BiteRecentSearchButton({super.key, required this.search});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showSearch(
          context: context,
          delegate: OpenSearchScreen(),
          query: search,
        );
      },
      onLongPress: () {
        context.read<RecentSearchesCubit>().removeSearch(search);
      },
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r),
          side: BorderSide(color: Theme.of(context).colorScheme.primary),
        ),
      ),
      child: Text(
        search,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
