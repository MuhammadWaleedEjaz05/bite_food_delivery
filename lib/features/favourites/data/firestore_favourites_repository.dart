import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../domain/favourites_repository.dart';

class FirestoreFavouritesRepository implements FavouritesRepository {
  const FirestoreFavouritesRepository(this.database);
  final FirebaseFirestore database;
  CollectionReference<Map<String, dynamic>> _collection(String uid) =>
      database.collection('UsersDB').doc(uid).collection('favourites');
  @override
  Stream<Set<String>> watch(String userId) =>
      _collection(userId).snapshots().map(
        (snapshot) => snapshot.docs
            .map((doc) => doc.data()['key'])
            .whereType<String>()
            .toSet(),
      );
  @override
  Future<void> set(String userId, String key, bool selected) {
    final ref = _collection(userId).doc(base64Url.encode(utf8.encode(key)));
    return selected ? ref.set({'key': key}) : ref.delete();
  }
}
