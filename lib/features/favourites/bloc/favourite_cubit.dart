import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../domain/favourites_repository.dart';
part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit(this.repository) : super(const FavouriteState());
  final FavouritesRepository repository;
  StreamSubscription<Set<String>>? _subscription;
  int _generation = 0;
  bool selection(String id, FavouriteType type, bool fallback) =>
      state.keys.contains('${type.name}:$id');
  void bindUser(String? userId, {bool retry = false}) {
    if (isClosed || (!retry && state.userId == userId)) return;
    final generation = ++_generation;
    _subscription?.cancel();
    emit(FavouriteState(userId: userId, loading: userId != null));
    if (userId == null) return;
    _subscription = repository
        .watch(userId)
        .listen(
          (keys) {
            if (isClosed || generation != _generation) return;
            emit(
              FavouriteState(
                userId: userId,
                keys: Set.unmodifiable(keys),
                pending: state.pending,
              ),
            );
          },
          onError: (Object error) {
            if (isClosed || generation != _generation) return;
            emit(
              FavouriteState(
                userId: userId,
                keys: state.keys,
                failed: true,
                pending: state.pending,
              ),
            );
          },
        );
  }

  Future<void> setSelection(String id, FavouriteType type, bool value) async {
    final user = state.userId;
    if (user == null) throw StateError('Sign in required');
    final key = '${type.name}:$id';
    if (state.pending.contains(key)) return;
    final generation = _generation;
    emit(
      FavouriteState(
        userId: user,
        keys: state.keys,
        pending: Set.unmodifiable({...state.pending, key}),
      ),
    );
    try {
      await repository.set(user, key, value);
      if (!isClosed && generation == _generation) {
        final keys = {...state.keys};
        value ? keys.add(key) : keys.remove(key);
        emit(
          FavouriteState(
            userId: user,
            keys: Set.unmodifiable(keys),
            pending: Set.unmodifiable({...state.pending}..remove(key)),
          ),
        );
      }
    } catch (_) {
      if (!isClosed && generation == _generation) {
        emit(
          FavouriteState(
            userId: user,
            keys: state.keys,
            pending: Set.unmodifiable({...state.pending}..remove(key)),
          ),
        );
      }
      rethrow;
    }
  }

  @override
  Future<void> close() async {
    ++_generation;
    await _subscription?.cancel();
    return super.close();
  }
}
