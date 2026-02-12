import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:bite_food_delivery/Screens/OrderHistoryPage/Widgets/bite_tab_bar.dart';
import 'package:bite_food_delivery/Screens/OrderHistoryPage/Widgets/biteorder_history_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBarSection(),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            BiteTabBar(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: TabBarView(
                  children: [_OngoingOrderSection(), _HistoryOrderSection()],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AppBarSection extends StatelessWidget implements PreferredSizeWidget {
  const _AppBarSection();
  @override
  Size get preferredSize => Size.fromHeight(100.h);
  @override
  Widget build(BuildContext context) {
    return BiteAppBar(
      backButton: true,
      title: Text(
        'Order History',
        style: GoogleFonts.sen(
          fontSize: 30.sp,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
        ),
      ),
      actions: [],
    );
  }
}

class _OngoingOrderSection extends StatelessWidget {
  const _OngoingOrderSection();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      itemBuilder: (context, index) {
        return BiteOrderHistoryCard();
      },
      separatorBuilder: (context, index) {
        return 10.verticalSpace;
      },
    );
  }
}

class _HistoryOrderSection extends StatelessWidget {
  const _HistoryOrderSection();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      itemBuilder: (context, index) {
        return BiteOrderHistoryCard(isCompleted: true);
      },
      separatorBuilder: (context, index) {
        return 10.verticalSpace;
      },
    );
  }
}
