abstract interface class FavouritesRepository {
  Stream<Set<String>> watch(String userId);
  Future<void> set(String userId, String key, bool selected);
}
