import 'package:bite_food_delivery/features/orders/sections/order_history_filter_section.dart';
import 'package:bite_food_delivery/features/orders/sections/order_history_header_section.dart';
import 'package:bite_food_delivery/features/orders/sections/order_history_list_section.dart';
import 'package:material_ui/material_ui.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  bool _showCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          key: const PageStorageKey('order_history'),
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [
            const OrderHistoryHeaderSection(),
            OrderHistoryFilterSection(
              showCompleted: _showCompleted,
              onFilterChanged: (value) =>
                  setState(() => _showCompleted = value),
            ),
            OrderHistoryListSection(showCompleted: _showCompleted),
          ],
        ),
      ),
    );
  }
}
