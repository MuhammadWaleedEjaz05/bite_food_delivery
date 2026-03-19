part of 'favourite_cubit.dart';

sealed class FavouriteState extends Equatable {
  const FavouriteState();

  @override
  List<Object> get props => [];
}

final class FavouriteInitial extends FavouriteState {}

enum FavouriteType { restaurant, foodItem }

final class FavouriteChanged extends FavouriteState {
  final String id;
  final FavouriteType type;
  final bool isFavourite;

  const FavouriteChanged({
    required this.id,
    required this.type,
    required this.isFavourite,
  });

  @override
  List<Object> get props => [id, type, isFavourite];
}
