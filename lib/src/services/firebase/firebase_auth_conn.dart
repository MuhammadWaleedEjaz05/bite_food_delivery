import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth get auth => FirebaseAuth.instance;

User? getCurrentUser() {
  try {
    return FirebaseAuth.instance.currentUser;
  } catch (_) {
    return null;
  }
}
