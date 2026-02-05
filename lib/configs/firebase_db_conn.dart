import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore database = FirebaseFirestore.instance;

CollectionReference getCollection(String collectionName) {
  return database.collection(collectionName);
}
