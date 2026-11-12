part of 'discovery_cubit.dart';

enum DiscoveryKind { all, restaurants, foods }

enum DiscoverySort { recommended, name, delivery }

class DiscoveryState {
  const DiscoveryState({
    this.restaurants = const [],
    this.foods = const [],
    this.loading = false,
    this.loaded = false,
    this.failed = false,
    this.query = '',
    this.category = '',
    this.kind = DiscoveryKind.all,
    this.sort = DiscoverySort.recommended,
    this.openOnly = false,
    this.limit = 20,
    this.recent = const [],
  });
  final List<RestaurantModel> restaurants;
  final List<FoodItemModel> foods;
  final bool loading, loaded, failed, openOnly;
  final String query, category;
  final DiscoveryKind kind;
  final DiscoverySort sort;
  final int limit;
  final List<String> recent;
  List<String> get categories => ({
    ...restaurants.map((e) => e.category),
    ...foods.map((e) => e.category),
  }.where((e) => e.trim().isNotEmpty).toList()..sort());
  Map<String, RestaurantModel> get byRestaurant => {
    for (final r in restaurants) r.id: r,
  };
  bool _matches(String value) => query
      .trim()
      .toLowerCase()
      .split(RegExp(r'\s+'))
      .every((word) => value.toLowerCase().contains(word));
  List<RestaurantModel> restaurantResults({Set<String>? saved}) {
    if (kind == DiscoveryKind.foods) return const [];
    final result = restaurants
        .where(
          (r) =>
              (!openOnly || r.isOpen) &&
              (category.isEmpty || r.category == category) &&
              (saved == null || saved.contains('restaurant:${r.id}')) &&
              _matches('${r.name} ${r.category} ${r.description}'),
        )
        .toList();
    result.sort((a, b) {
      final primary = switch (sort) {
        DiscoverySort.recommended => b.rating.compareTo(a.rating),
        DiscoverySort.delivery => a.deliveryTime.compareTo(b.deliveryTime),
        DiscoverySort.name => a.name.toLowerCase().compareTo(
          b.name.toLowerCase(),
        ),
      };
      return primary == 0 ? a.id.compareTo(b.id) : primary;
    });
    return result;
  }

  List<FoodItemModel> foodResults({Set<String>? saved}) {
    if (kind == DiscoveryKind.restaurants) return const [];
    final parents = byRestaurant;
    final result = foods.where((f) {
      final parent = parents[f.restaurantId];
      return parent != null &&
          (!openOnly || (parent.isOpen && f.isAvailable != false)) &&
          (category.isEmpty || f.category == category) &&
          (saved == null || saved.contains('foodItem:${f.id}')) &&
          _matches('${f.name} ${f.category} ${f.description} ${parent.name}');
    }).toList();
    result.sort((a, b) {
      final primary = switch (sort) {
        DiscoverySort.recommended => parents[b.restaurantId]!.rating.compareTo(
          parents[a.restaurantId]!.rating,
        ),
        DiscoverySort.delivery =>
          parents[a.restaurantId]!.deliveryTime.compareTo(
            parents[b.restaurantId]!.deliveryTime,
          ),
        DiscoverySort.name => a.name.toLowerCase().compareTo(
          b.name.toLowerCase(),
        ),
      };
      return primary == 0 ? a.id.compareTo(b.id) : primary;
    });
    return result;
  }

  DiscoveryState copyWith({
    List<RestaurantModel>? restaurants,
    List<FoodItemModel>? foods,
    bool? loading,
    bool? loaded,
    bool? failed,
    bool? openOnly,
    String? query,
    String? category,
    DiscoveryKind? kind,
    DiscoverySort? sort,
    int? limit,
    List<String>? recent,
  }) => DiscoveryState(
    restaurants: restaurants ?? this.restaurants,
    foods: foods ?? this.foods,
    loading: loading ?? this.loading,
    loaded: loaded ?? this.loaded,
    failed: failed ?? this.failed,
    openOnly: openOnly ?? this.openOnly,
    query: query ?? this.query,
    category: category ?? this.category,
    kind: kind ?? this.kind,
    sort: sort ?? this.sort,
    limit: limit ?? this.limit,
    recent: recent ?? this.recent,
  );
}
