part of 'categories_cubit.dart';

sealed class CategoriesState extends Equatable {
  const CategoriesState();
  @override
  List<Object> get props => [];
}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoading extends CategoriesState {}

final class CategoriesLoaded extends CategoriesState {
  const CategoriesLoaded({
    required this.categories,
    this.refreshing = false,
    this.refreshFailed = false,
  });
  final List<CategoryModel> categories;
  final bool refreshing;
  final bool refreshFailed;
  @override
  List<Object> get props => [categories, refreshing, refreshFailed];
}

final class CategoriesError extends CategoriesState {
  const CategoriesError({required this.error});
  final String error;
  @override
  List<Object> get props => [error];
}
