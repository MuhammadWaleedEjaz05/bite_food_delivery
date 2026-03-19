import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'recent_searches_state.dart';

class RecentSearchesCubit extends Cubit<RecentSearchesState> {
  final List<String> _recentSearches = [];
  RecentSearchesCubit() : super(RecentSearchesInitial()) {
    emit(RecentSearchesLoaded(List.from(_recentSearches)));
  }

  void addSearch(String search) {
    if (!_recentSearches.contains(search)) {
      _recentSearches.insert(0, search);
      emit(RecentSearchedAdded(search));
      emit(RecentSearchesLoaded(List.from(_recentSearches)));
    }
  }

  void removeSearch(String search) {
    if (_recentSearches.contains(search)) {
      _recentSearches.remove(search);
      emit(RecentSearchedRemoved(search));
      emit(RecentSearchesLoaded(List.from(_recentSearches)));
    }
  }

  void clearSearches() {
    _recentSearches.clear();
    emit(RecentSearchesLoaded(List.from(_recentSearches)));
  }
}
