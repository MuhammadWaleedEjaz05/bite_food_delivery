part of 'restaurant_menu_cubit.dart';

class RestaurantMenuState {
  const RestaurantMenuState({
    this.items = const [],
    this.selectedCategory = '',
    this.loading = false,
    this.failed = false,
  });
  final List<FoodItemModel> items;
  final String selectedCategory;
  final bool loading, failed;
  List<String> get categories =>
      items.map((i) => i.category).where((c) => c.isNotEmpty).toSet().toList()
        ..sort();
  List<FoodItemModel> get visibleItems => selectedCategory.isEmpty
      ? items
      : items.where((i) => i.category == selectedCategory).toList();
}
