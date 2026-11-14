import 'package:material_ui/material_ui.dart';
import '../sections/orders_header_section.dart';
import '../sections/orders_activity_section.dart';
import '../sections/orders_history_section.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(
    body: SafeArea(
      child: CustomScrollView(
        key: PageStorageKey('orders'),
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          OrdersHeaderSection(),
          OrdersActivitySection(),
          OrdersHistorySection(),
        ],
      ),
    ),
  );
}
