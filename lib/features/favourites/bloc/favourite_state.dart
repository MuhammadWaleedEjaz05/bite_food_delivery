part of 'favourite_cubit.dart';

enum FavouriteType { restaurant, foodItem }

class FavouriteState {
  const FavouriteState({
    this.userId,
    this.keys = const {},
    this.pending = const {},
    this.loading = false,
    this.failed = false,
  });
  final String? userId;
  final Set<String> keys, pending;
  final bool loading, failed;
}
