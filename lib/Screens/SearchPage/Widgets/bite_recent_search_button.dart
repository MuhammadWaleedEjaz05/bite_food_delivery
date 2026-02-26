import 'package:bite_food_delivery/Cubits/RecentSearchesCubit/recent_searches_cubit.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

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
        BlocProvider.of<RecentSearchesCubit>(context).removeSearch(search);
      },
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r),
          side: BorderSide(color: Colors.deepOrange),
        ),
      ),
      child: Text(
        search,
        style: GoogleFonts.sen(fontSize: 16.sp, color: Colors.deepOrange),
      ),
    );
  }
}
