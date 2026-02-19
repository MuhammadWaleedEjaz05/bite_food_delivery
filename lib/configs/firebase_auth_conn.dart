import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth get auth => FirebaseAuth.instance;

User? getCurrentUser() {
  return auth.currentUser;
}
