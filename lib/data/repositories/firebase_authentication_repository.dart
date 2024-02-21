import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/data/di/firebase_authentication_module.dart';
import 'package:story_creator/data/exceptions/firebase_authenticaton_exceptions.dart';

class FirebaseAuthenticationRepository {
  final Ref ref;
  FirebaseAuthenticationRepository(this.ref);

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    final firebaseAuth = ref.read(firebaseAuthProvider);

    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user != null) {
        return userCredential.user;
      } else {
        throw UserNotLoggedIn();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw UserNotFoundException();
      } else if (e.code == 'wrong-password') {
        throw WrongPasswordException();
      } else {
        throw GenericException();
      }
    } catch (e) {
      throw GenericException();
    }
  }

  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    final firebaseAuth = ref.read(firebaseAuthProvider);
    try {
      try {
        final result = await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        User? user = result.user;
        if (user != null) {
          return user;
        } else {
          throw UserNotLoggedIn();
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          throw WeakPasswordException();
        } else if (e.code == 'email-already-in-use') {
          throw EmailAlreadyInUse();
        } else if (e.code == 'invalid-email') {
          throw InvalidEmailException();
        } else {
          throw GenericException();
        }
      }
    } catch (e) {
      throw GenericException();
    }
  }

  Future<void> logout() async {
    final firebaseAuth = ref.read(firebaseAuthProvider);
    final user = firebaseAuth.currentUser;
    if (user != null) {
      await firebaseAuth.signOut();
    } else {
      throw UserNotLoggedIn();
    }
  }

  Future<void> sendEmailVerification() async {
    final firebaseAuth = ref.read(firebaseAuthProvider);
    final user = firebaseAuth.currentUser;
    if (user != null) {
      await user.sendEmailVerification();
    } else {
      throw UserNotLoggedIn();
    }
  }

  Future<void> sendEmailResetPassword(String email) async {
    try {
      final firebaseAuth = ref.read(firebaseAuthProvider);
      firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw UserNotFoundException();
      } else if (e.code == 'invalid-email') {
        throw InvalidEmailException();
      } else {
        throw GenericException();
      }
    }
  }
}
