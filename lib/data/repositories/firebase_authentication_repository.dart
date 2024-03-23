import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/data/di/firebase_authentication_module.dart';
import 'package:story_creator/data/exceptions/firebase_authenticaton_exceptions.dart';
import 'package:story_creator/data/providers/google_signin_credentials_provider.dart';
import 'package:story_creator/data/providers/signin_credentials_github_provider.dart';
import 'package:story_creator/data/providers/signin_facebook_credentials_provider.dart';
import 'package:story_creator/data/providers/signin_yahoo_crendentials_provider.dart';

class FirebaseAuthenticationRepository {
  final Ref ref;
  FirebaseAuthenticationRepository(this.ref);

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

  Future<User?>? signInWithEmailAndPassword(
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

  Future<User?> signInWithGithubProvider() async {
    try {
      final firebaseAuth = ref.read(firebaseAuthProvider);
      final githubApp = await ref.read(githubAppProvider.future);
      final provider = await githubApp.signInWithProvider();
      final userCredential = await firebaseAuth.signInWithProvider(provider);
      if (userCredential.user != null) {
        return userCredential.user;
      } else {
        throw UserNotLoggedIn();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        throw AccountExistisWithDifferentCredential();
      } else if (e.code == 'invalid-email') {
        throw InvalidEmailException();
      } else {
        throw GenericException();
      }
    } catch (e) {
      throw GenericException();
    }
  }

  Future<User?> signInWithYahooProvider() async {
    try {
      final firebaseAuth = ref.read(firebaseAuthProvider);
      final yahooApp = await ref.read(yahooAppProvider.future);
      final provider = await yahooApp.signInWithProvider();
      final userCredential = await firebaseAuth.signInWithProvider(provider);
      if (userCredential.user != null) {
        return userCredential.user;
      } else {
        throw UserNotLoggedIn();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        throw AccountExistisWithDifferentCredential();
      } else if (e.code == 'invalid-email') {
        throw InvalidEmailException();
      } else {
        throw GenericException();
      }
    } catch (e) {
      throw GenericException();
    }
  }

  Future<User?> signInWithGoogleCredentials() async {
    try {
      final firebaseAuth = ref.read(firebaseAuthProvider);
      final googleAuth = await ref.read(googleCredentialsProvider.future);
      final authCredentials =
          await googleAuth.signInCredentials();
      final userCredential =
          await firebaseAuth.signInWithCredential(authCredentials);
      if (userCredential.user != null) {
        return userCredential.user;
      } else {
        throw UserNotLoggedIn();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        throw AccountExistisWithDifferentCredential();
      } else if (e.code == 'invalid-email') {
        throw InvalidEmailException();
      } else {
        throw GenericException();
      }
    } catch (e) {
      throw GenericException();
    }
  }

  Future<User?> signInWithFacebookCredentials() async {
    final firebaseAuth = ref.read(firebaseAuthProvider);
    final facebookAuth = await ref.read(facebookCredentialsProvider.future);
    final authCredentials = await facebookAuth.signInCredentials();
    final userCredential =
        await firebaseAuth.signInWithCredential(authCredentials!);
    if (userCredential.user != null) {
      return userCredential.user;
    } else {
      throw UserNotLoggedIn();
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

  Future<void> updateCurrentUserDisplayName(String displayName) async {
    try {
      final firebaseAuth = ref.read(firebaseAuthProvider);
      final currentUser = firebaseAuth.currentUser;

      if (currentUser != null) {
        currentUser.updateDisplayName(displayName);
      }
    } on FirebaseAuthException {
      throw GenericException();
    }
  }

  Future<String> getCurrentUserDisplayName() async {
    try {
      final firebaseAuth = ref.read(firebaseAuthProvider);
      final currentUser = firebaseAuth.currentUser;
      if (currentUser != null) {
        return currentUser.displayName ?? '';
      } else {
        throw UserNotLoggedIn();
      }
    } on FirebaseAuthException {
      throw GenericException();
    }
  }

  Future<void> changeUserPassword(String newPassword) async {
    try {
      final firebaseAuth = ref.read(firebaseAuthProvider);
      final currentUser = firebaseAuth.currentUser;
      if (currentUser != null) {
        return currentUser.updatePassword(newPassword);
      } else {
        throw UserNotLoggedIn();
      }
    } on FirebaseAuthException {
      throw GenericException();
    }
  }

  Future<void> updateCurrentUserPhotoURL(String newPhotoURL) async {
    try {
      final firebaseAuth = ref.read(firebaseAuthProvider);
      final currentUser = firebaseAuth.currentUser;

      if (currentUser != null) {
        currentUser.updatePhotoURL(newPhotoURL);
      }
    } on FirebaseAuthException {
      throw GenericException();
    }
  }

  Future<String> getCurrentUserPhotoURL() async {
    try {
      final firebaseAuth = ref.read(firebaseAuthProvider);
      final currentUser = firebaseAuth.currentUser;
      if (currentUser != null) {
        return currentUser.photoURL ?? '';
      } else {
        throw UserNotLoggedIn();
      }
    } on FirebaseAuthException {
      throw GenericException();
    }
  }

  Future<bool> checkIfAccountIsVerified() async {
    try {
      final firebaseAuth = ref.read(firebaseAuthProvider);
      return (firebaseAuth.currentUser != null)
          ? (firebaseAuth.currentUser!.emailVerified == true)
              ? true
              : false
          : false;
    } on FirebaseAuthException {
      throw GenericException();
    }
  }
}
