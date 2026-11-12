import 'package:bite_food_delivery/features/addresses/models/address_model.dart';
import 'package:bite_food_delivery/features/authentication/bloc/user_auth_state.dart';
import 'package:bite_food_delivery/features/authentication/models/user_model.dart';
import 'package:bite_food_delivery/src/services/firebase/firebase_auth_conn.dart';
import 'package:bite_food_delivery/src/services/firebase/firebase_db_conn.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

export 'user_auth_state.dart';

class UserAuthCubit extends Cubit<UserAuthState> {
  final FirebaseAuth? _auth;
  final GoogleSignIn? _googleSignIn;

  UserAuthCubit({
    FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
    bool autoCheck = true,
  }) : _auth = firebaseAuth,
       _googleSignIn = googleSignIn,
       super(const UserAuthInitial()) {
    if (autoCheck) {
      checkAuthStatus();
    }
  }

  FirebaseAuth? get _authInstance {
    if (_auth != null) return _auth;
    try {
      return FirebaseAuth.instance;
    } catch (_) {
      return null;
    }
  }

  GoogleSignIn get _googleSignInInstance {
    if (_googleSignIn != null) return _googleSignIn;
    return GoogleSignIn.instance;
  }

  Future<UserModel> _withAddresses(UserModel user, String userId) async {
    try {
      final db = getCollection('UsersDB');
      final addressSnapshot = await db
          .doc(userId)
          .collection('addresses')
          .get();
      final addresses = addressSnapshot.docs
          .map((doc) => AddressModel.fromJson(doc.data()))
          .toList();
      return user.copyWith(addresses: addresses);
    } catch (_) {
      return user;
    }
  }

  Future<void> login(String email, String password) async {
    try {
      emit(const UserLoading());
      final currentAuth = _authInstance;
      if (currentAuth == null) {
        emit(const UserAuthError('Authentication service unavailable'));
        return;
      }
      await currentAuth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      final currentUser = currentAuth.currentUser;
      if (currentUser == null) {
        emit(const UserAuthError('Login failed: no authenticated user'));
        return;
      }
      final db = getCollection('UsersDB');
      final userDoc = await db.doc(currentUser.uid).get();
      if (!userDoc.exists) {
        emit(const UserAuthError('User data not found in database'));
        return;
      }
      final data = userDoc.data() as Map<String, dynamic>?;
      if (data == null) {
        emit(const UserAuthError('User data is empty'));
        return;
      }
      final userWithAddresses = await _withAddresses(
        UserModel.fromJson(data),
        currentUser.uid,
      );
      emit(UserLoggedIn(userWithAddresses));
    } catch (e) {
      emit(UserAuthError(e.toString()));
    }
  }

  bool _googleInitialized = false;

  Future<void> _ensureGoogleInitialized() async {
    if (!_googleInitialized) {
      await _googleSignInInstance.initialize();
      _googleInitialized = true;
    }
  }

  Future<void> logout() async {
    try {
      emit(const UserLoading());
      await _ensureGoogleInitialized();
      await _googleSignInInstance.signOut();
      final currentAuth = _authInstance;
      if (currentAuth != null) {
        await currentAuth.signOut();
      }
      emit(const UserLoggedOut());
    } catch (e) {
      emit(UserAuthError(e.toString()));
    }
  }

  Future<void> register(UserModel user) async {
    try {
      emit(const UserLoading());
      final currentAuth = _authInstance;
      if (currentAuth == null) {
        emit(const UserAuthError('Authentication service unavailable'));
        return;
      }
      await currentAuth.createUserWithEmailAndPassword(
        email: user.email.trim(),
        password: user.password!,
      );
      final currentUser = currentAuth.currentUser;
      if (currentUser == null) {
        emit(const UserAuthError('Registration failed: no authenticated user'));
        return;
      }
      final db = getCollection('UsersDB');
      await db
          .doc(currentUser.uid)
          .set(user.copyWith(id: currentUser.uid).toJson());
      emit(const UserCreated());
    } catch (e) {
      emit(UserAuthError(e.toString()));
    }
  }

  Future<void> checkAuthStatus() async {
    try {
      final currentUser = getCurrentUser();
      if (currentUser == null) {
        emit(const UserLoggedOut());
        return;
      }

      final db = getCollection('UsersDB');
      final userDoc = await db.doc(currentUser.uid).get();
      if (!userDoc.exists) {
        emit(const UserLoggedOut());
        return;
      }

      final data = userDoc.data() as Map<String, dynamic>?;
      if (data == null) {
        emit(const UserLoggedOut());
        return;
      }
      final userWithAddresses = await _withAddresses(
        UserModel.fromJson(data),
        currentUser.uid,
      );
      emit(UserLoggedIn(userWithAddresses));
    } catch (e) {
      emit(UserAuthError(e.toString()));
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      emit(const UserLoading());
      final currentAuth = _authInstance;
      if (currentAuth == null) {
        emit(const UserAuthError('Authentication service unavailable'));
        return;
      }
      await currentAuth.sendPasswordResetEmail(email: email.trim());
      emit(const UserAuthInitial());
    } catch (e) {
      emit(UserAuthError(e.toString()));
    }
  }

  Future<void> confirmResetPassword(String code, String newPassword) async {
    try {
      emit(const UserLoading());
      final currentAuth = _authInstance;
      if (currentAuth == null) {
        emit(const UserAuthError('Authentication service unavailable'));
        return;
      }
      await currentAuth.confirmPasswordReset(
        code: code,
        newPassword: newPassword,
      );
      emit(const UserAuthInitial());
    } catch (e) {
      emit(UserAuthError(e.toString()));
    }
  }

  Future<void> updateUserProfile(Map<String, dynamic> updates) async {
    for (final entry in updates.entries) {
      if (entry.key == 'fullName') {
        await updateProfile('Full Name', entry.value);
      } else if (entry.key == 'email') {
        await updateProfile('Email', entry.value);
      } else if (entry.key == 'phoneNumber') {
        await updateProfile('Phone Number', entry.value);
      } else if (entry.key == 'bio') {
        await updateProfile('Bio', entry.value);
      }
    }
  }

  Future<void> updateProfile(String title, dynamic value) async {
    try {
      final currentUser = getCurrentUser();
      if (currentUser == null) {
        emit(const UserAuthError('No authenticated user'));
        return;
      }
      emit(const UserLoading());
      final db = getCollection('UsersDB');

      if (title == 'Full Name') {
        await db.doc(currentUser.uid).update({'fullName': value});
      } else if (title == 'Email') {
        await currentUser.verifyBeforeUpdateEmail(value);
        await db.doc(currentUser.uid).update({'email': value});
      } else if (title == 'Phone Number') {
        await db.doc(currentUser.uid).update({'phoneNumber': value});
      } else if (title == 'Bio') {
        await db.doc(currentUser.uid).update({'bio': value});
      } else if (title == 'Address') {
        if (value is! AddressModel) {
          emit(const UserAuthError('Invalid address data'));
          return;
        }
        final AddressModel newAddress = AddressModel(
          addressID: value.addressID,
          userID: currentUser.uid,
          label: value.label,
          street: value.street,
          city: value.city,
          zipCode: value.zipCode,
          country: value.country,
          location: value.location,
        );
        await db
            .doc(currentUser.uid)
            .collection('addresses')
            .doc(newAddress.addressID)
            .set(newAddress.toJson());
      }

      final updatedDoc = await db.doc(currentUser.uid).get();
      if (!updatedDoc.exists) {
        emit(const UserAuthError('User data not found after update'));
        return;
      }
      final updatedData = updatedDoc.data() as Map<String, dynamic>?;
      if (updatedData == null) {
        emit(const UserAuthError('Updated user data is empty'));
        return;
      }
      final userWithAddresses = await _withAddresses(
        UserModel.fromJson(updatedData),
        currentUser.uid,
      );
      emit(UserLoggedIn(userWithAddresses));
    } catch (e) {
      emit(UserAuthError(e.toString()));
    }
  }

  Stream<List<AddressModel>> watchAddresses() {
    final currentUser = getCurrentUser();
    if (currentUser == null) {
      return Stream.value([]);
    }
    final db = getCollection('UsersDB');
    return db
        .doc(currentUser.uid)
        .collection('addresses')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => AddressModel.fromJson(doc.data()))
              .toList(),
        );
  }

  Future<void> deleteAddress(String addressID) async {
    try {
      final currentUser = getCurrentUser();
      if (currentUser == null) {
        emit(const UserAuthError('No authenticated user'));
        return;
      }
      emit(const UserLoading());
      final db = getCollection('UsersDB');
      await db
          .doc(currentUser.uid)
          .collection('addresses')
          .doc(addressID)
          .delete();
      final updatedDoc = await db.doc(currentUser.uid).get();
      if (!updatedDoc.exists) {
        emit(const UserAuthError('User data not found after deletion'));
        return;
      }
      final updatedData = updatedDoc.data() as Map<String, dynamic>?;
      if (updatedData == null) {
        emit(const UserAuthError('Updated user data is empty'));
        return;
      }
      emit(UserLoggedIn(UserModel.fromJson(updatedData)));
    } catch (e) {
      emit(UserAuthError(e.toString()));
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      emit(const UserLoading());

      await _ensureGoogleInitialized();
      await _googleSignInInstance.signOut();
      final GoogleSignInAccount googleUser = await _googleSignInInstance
          .authenticate();

      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final currentAuth = _authInstance;
      if (currentAuth == null) {
        emit(const UserAuthError('Authentication service unavailable'));
        return;
      }
      final userCredential = await currentAuth.signInWithCredential(credential);
      final currentUser = userCredential.user;

      if (currentUser == null) {
        emit(
          const UserAuthError('Google sign-in failed: no authenticated user'),
        );
        return;
      }

      final db = getCollection('UsersDB');
      final userDoc = await db.doc(currentUser.uid).get();

      if (!userDoc.exists) {
        final newUser = UserModel(
          id: currentUser.uid,
          fullName: currentUser.displayName ?? 'User',
          email: currentUser.email ?? '',
          phoneNumber: currentUser.phoneNumber,
          photoUrl: currentUser.photoURL,
        );

        await db.doc(currentUser.uid).set(newUser.toJson());
        emit(UserLoggedIn(newUser));
        return;
      }

      final data = userDoc.data() as Map<String, dynamic>?;
      if (data == null) {
        emit(const UserAuthError('User data is empty'));
        return;
      }
      final userWithAddresses = await _withAddresses(
        UserModel.fromJson(data),
        currentUser.uid,
      );
      emit(UserLoggedIn(userWithAddresses));
    } catch (e) {
      emit(UserAuthError(e.toString()));
    }
  }
}
