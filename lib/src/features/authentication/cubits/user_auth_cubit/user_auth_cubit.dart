import 'package:bite_food_delivery/src/features/address_management/models/address_model.dart';
import 'package:bite_food_delivery/src/features/authentication/models/user_model.dart';
import 'package:bite_food_delivery/src/services/firebase/firebase_auth_conn.dart';
import 'package:bite_food_delivery/src/services/firebase/firebase_db_conn.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'user_auth_state.dart';

class UserAuthCubit extends Cubit<UserAuthState> {
  UserAuthCubit() : super(UserAuthInitial()) {
    checkAuthStatus();
  }

  Future<UserModel> _withAddresses(UserModel user, String userId) async {
    final db = getCollection('UsersDB');
    final addressSnapshot = await db.doc(userId).collection('addresses').get();
    final addresses = addressSnapshot.docs
        .map((doc) => AddressModel.fromJson(doc.data()))
        .toList();
    return user.copyWith(addresses: addresses);
  }

  Future<void> login(String email, String password) async {
    try {
      emit(UserLoading());
      await auth.signInWithEmailAndPassword(email: email, password: password);
      final currentUser = auth.currentUser;
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
      await GoogleSignIn.instance.initialize();
      _googleInitialized = true;
    }
  }

  Future<void> logout() async {
    try {
      emit(UserLoading());
      await _ensureGoogleInitialized();
      await GoogleSignIn.instance.signOut();
      await auth.signOut();
      emit(UserLoggedOut());
    } catch (e) {
      emit(UserAuthError(e.toString()));
    }
  }

  Future<void> register(UserModel user) async {
    try {
      emit(UserLoading());
      await auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password!,
      );
      final currentUser = auth.currentUser;
      if (currentUser == null) {
        emit(const UserAuthError('Registration failed: no authenticated user'));
        return;
      }
      final db = getCollection('UsersDB');
      await db
          .doc(currentUser.uid)
          .set(user.copyWith(id: currentUser.uid).toJson());
      emit(UserCreated());
    } catch (e) {
      emit(UserAuthError(e.toString()));
    }
  }

  Future<void> checkAuthStatus() async {
    try {
      final currentUser = getCurrentUser();
      if (currentUser == null) {
        emit(UserLoggedOut());
        return;
      }

      final db = getCollection('UsersDB');
      final userDoc = await db.doc(currentUser.uid).get();
      if (!userDoc.exists) {
        emit(UserLoggedOut());
        return;
      }

      final data = userDoc.data() as Map<String, dynamic>?;
      if (data == null) {
        emit(UserLoggedOut());
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
      emit(UserLoading());
      await auth.sendPasswordResetEmail(email: email);
      emit(UserAuthInitial());
    } catch (e) {
      emit(UserAuthError(e.toString()));
    }
  }

  Future<void> confirmResetPassword(String code, String newPassword) async {
    try {
      emit(UserLoading());
      await auth.confirmPasswordReset(code: code, newPassword: newPassword);
      emit(UserAuthInitial());
    } catch (e) {
      emit(UserAuthError(e.toString()));
    }
  }

  Future<void> updateProfile(String title, dynamic value) async {
    try {
      if (title == 'Full Name') {
        emit(UserLoading());
        final currentUser = getCurrentUser();
        if (currentUser == null) {
          emit(const UserAuthError('No authenticated user'));
          return;
        }
        final db = getCollection('UsersDB');
        await db.doc(currentUser.uid).update({'fullName': value});
        final userDoc = await db.doc(currentUser.uid).get();
        if (!userDoc.exists) {
          emit(const UserAuthError('User data not found after update'));
          return;
        }
        final data = userDoc.data() as Map<String, dynamic>?;
        if (data == null) {
          emit(const UserAuthError('Updated user data is empty'));
          return;
        }
        final userWithAddresses = await _withAddresses(
          UserModel.fromJson(data),
          currentUser.uid,
        );
        emit(UserLoggedIn(userWithAddresses));
      } else if (title == 'Email') {
        emit(UserLoading());
        final currentUser = getCurrentUser();
        if (currentUser == null) {
          emit(const UserAuthError('No authenticated user'));
          return;
        }
        await currentUser.verifyBeforeUpdateEmail(value);
        final db = getCollection('UsersDB');
        await db.doc(currentUser.uid).update({'email': value});

        final userDoc = await db.doc(currentUser.uid).get();
        if (!userDoc.exists) {
          emit(const UserAuthError('User data not found after update'));
          return;
        }
        final data = userDoc.data() as Map<String, dynamic>?;
        if (data == null) {
          emit(const UserAuthError('Updated user data is empty'));
          return;
        }
        final userWithAddresses = await _withAddresses(
          UserModel.fromJson(data),
          currentUser.uid,
        );
        emit(UserLoggedIn(userWithAddresses));
      } else if (title == 'Phone Number') {
        emit(UserLoading());
        final currentUser = getCurrentUser();
        if (currentUser == null) {
          emit(const UserAuthError('No authenticated user'));
          return;
        }
        final db = getCollection('UsersDB');
        await db.doc(currentUser.uid).update({'phoneNumber': value});
        final userDoc = await db.doc(currentUser.uid).get();
        if (!userDoc.exists) {
          emit(const UserAuthError('User data not found after update'));
          return;
        }
        final data = userDoc.data() as Map<String, dynamic>?;
        if (data == null) {
          emit(const UserAuthError('Updated user data is empty'));
          return;
        }
        final userWithAddresses = await _withAddresses(
          UserModel.fromJson(data),
          currentUser.uid,
        );
        emit(UserLoggedIn(userWithAddresses));
      }
      if (title == 'Address') {
        emit(UserLoading());
        final currentUser = getCurrentUser();
        if (currentUser == null) {
          emit(const UserAuthError('No authenticated user'));
          return;
        }
        if (value is! AddressModel) {
          emit(const UserAuthError('Invalid address data'));
          return;
        }
        final db = getCollection('UsersDB');
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
      }
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
      emit(UserLoading());
      final currentUser = getCurrentUser();
      if (currentUser == null) {
        emit(const UserAuthError('No authenticated user'));
        return;
      }
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
      emit(UserLoading());

      await _ensureGoogleInitialized();
      await GoogleSignIn.instance.signOut();
      final GoogleSignInAccount googleUser = await GoogleSignIn.instance
          .authenticate();

      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final userCredential = await auth.signInWithCredential(credential);
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
