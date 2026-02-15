part of 'recent_searches_cubit.dart';

sealed class RecentSearchesState extends Equatable {
  const RecentSearchesState();

  @override
  List<Object> get props => [];
}

final class RecentSearchesInitial extends RecentSearchesState {}

final class RecentSearchedAdded extends RecentSearchesState {
  final String search;

  const RecentSearchedAdded(this.search);

  @override
  List<Object> get props => [search];
}

final class RecentSearchedRemoved extends RecentSearchesState {
  final String search;

  const RecentSearchedRemoved(this.search);

  @override
  List<Object> get props => [search];
}

final class RecentSearchesLoaded extends RecentSearchesState {
  final List<String> recentSearches;

  const RecentSearchesLoaded(this.recentSearches);

  @override
  List<Object> get props => [recentSearches];
}
