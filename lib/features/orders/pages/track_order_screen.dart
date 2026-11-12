import 'package:bite_food_delivery/features/orders/sections/track_order_courier_section.dart';
import 'package:bite_food_delivery/features/orders/sections/track_order_details_section.dart';
import 'package:bite_food_delivery/features/orders/sections/track_order_header_section.dart';
import 'package:bite_food_delivery/features/orders/sections/track_order_map_section.dart';
import 'package:bite_food_delivery/features/orders/sections/track_order_status_section.dart';
import 'package:bite_food_delivery/features/orders/sections/track_order_timeline_section.dart';
import 'package:flutter/material.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          key: PageStorageKey('track_order'),
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [
            TrackOrderHeaderSection(),
            TrackOrderStatusSection(),
            TrackOrderMapSection(),
            TrackOrderTimelineSection(),
            TrackOrderCourierSection(),
            TrackOrderDetailsSection(),
          ],
        ),
      ),
    );
  }
}
