import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/data/exceptions/firebase_authenticaton_exceptions.dart';
import 'package:story_creator/data/models/data_user.dart';
import 'package:story_creator/data/providers/firebase_authentication_repo_provider.dart';
import 'package:story_creator/data/providers/google_signin_credentials_provider.dart';

final authenticationServiceProvider = Provider<AuthenticationService>((ref) {
  final authService = AuthenticationService(ref);
  return authService;
});

class AuthenticationService {
  final Ref ref;
  AuthenticationService(this.ref);

  Future<DataUser?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      const useFirebase = true;

      if (useFirebase) {
        try {
          final firebaseAuthRepo =
              ref.read(firebaseAuthenticationRepositoryProvider);
          final user = await firebaseAuthRepo.createUserWithEmailAndPassword(
              email, password);
          if (user != null) {
            await user.reload();
            return DataUser(
              id: user.uid,
              email: user.email!,
              userName: '',
              isLogged: false,
            );
          } else {
            throw GenericException();
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            throw WeakPasswordException();
          } else if (e.code == 'email-already-in-use') {
            throw EmailAlreadyInUse();
          } else if (e.code == 'invalid-email') {
            throw InvalidEmailException();
          } else {
            throw Exception(e);
          }
        }
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      const useFirebase = true;
      if (useFirebase) {
        try {
          final firebaseAuthRepo =
              ref.read(firebaseAuthenticationRepositoryProvider);
          firebaseAuthRepo.sendEmailVerification();
        } catch (e) {
          throw Exception(e);
        }
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<DataUser?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      const useFirebase = true;

      if (useFirebase) {
        final firebaseAuthRepo =
            ref.read(firebaseAuthenticationRepositoryProvider);
        try {
          final user = await firebaseAuthRepo.signInWithEmailAndPassword(
              email, password);
          if (user != null) {
            await user.reload();
            return DataUser(
              id: user.uid,
              email: user.email!,
              userName: user.displayName ?? '',
              isLogged: true,
            );
          }
          return null;
        } catch (e) {
          throw Exception(e);
        }
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<DataUser?> signInWithGithubProvider() async {
    try {
      const useFirebase = true;
      if (useFirebase) {
        final firebaseAuthRepo =
            ref.read(firebaseAuthenticationRepositoryProvider);
        try {
          final user = await firebaseAuthRepo.signInWithGithubProvider();
          if (user != null) {
            await user.reload();
            return DataUser(
              id: user.uid,
              email: user.email!,
              userName: user.displayName ?? '',
              isLogged: true,
            );
          }
          return null;
        } catch (e) {
          if (e is AccountExistisWithDifferentCredential) {
            throw AccountExistisWithDifferentCredential();
          }
          throw Exception(e);
        }
      }
    } catch (e) {
      if (e is AccountExistisWithDifferentCredential) {
        throw AccountExistisWithDifferentCredential();
      }
      throw Exception(e);
    }
  }

  Future<DataUser?> signInWithGoogleProvider() async {
    try {
      const useFirebase = true;
      if (useFirebase) {
        final firebaseAuthRepo =
            ref.read(firebaseAuthenticationRepositoryProvider);
        try {
          final user = await firebaseAuthRepo.signInWithGoogleCredentials();
          if (user != null) {
            await user.reload();
            return DataUser(
              id: user.uid,
              email: user.email!,
              userName: user.displayName ?? '',
              isLogged: true,
            );
          }
          return null;
        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            throw AccountExistisWithDifferentCredential();
          }
        } catch (e) {
          throw Exception(e);
        }
      }
    } catch (e) {
      throw Exception(e);
    }
    return null;
  }

  Future<void> logout() async {
    try {
      const useFirebase = true;
      if (useFirebase) {
        try {
          final firebaseAuthRepo =
              ref.read(firebaseAuthenticationRepositoryProvider);
          firebaseAuthRepo.logout();

          _logoutGoogleProvider();
        } catch (e) {
          throw Exception(e);
        }
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> _logoutGoogleProvider() async {
    try {
      final googleAuth = await ref.read(googleCredentialsProvider.future);
      await googleAuth.signOut();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<bool> checkIfAccountIsVerified() async {
    try {
      const useFirebase = true;
      if (useFirebase) {
        try {
          final firebaseAuthRepo =
              ref.read(firebaseAuthenticationRepositoryProvider);
          return firebaseAuthRepo.checkIfAccountIsVerified();
        } catch (e) {
          throw Exception(e);
        }
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> sendEmailResetPassword(String email) async {
    try {
      const useFirebase = true;
      if (useFirebase) {
        try {
          final firebaseAuthRepo =
              ref.read(firebaseAuthenticationRepositoryProvider);
          firebaseAuthRepo.sendEmailResetPassword(email);
        } catch (e) {
          throw Exception(e);
        }
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> updateCurrentUserDisplayName(String displayName) async {
    try {
      const useFirebase = true;
      if (useFirebase) {
        try {
          final firebaseAuthRepo =
              ref.read(firebaseAuthenticationRepositoryProvider);
          firebaseAuthRepo.updateCurrentUserDisplayName(displayName);
        } catch (e) {
          throw Exception(e);
        }
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String> getCurrentUserDisplayName() async {
    try {
      const useFirebase = true;
      if (useFirebase) {
        final firebaseAuthRepo =
            ref.read(firebaseAuthenticationRepositoryProvider);
        return await firebaseAuthRepo.getCurrentUserDisplayName();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> changeUserPassword(String newPassword) async {
    try {
      const useFirebase = true;
      if (useFirebase) {
        final firebaseAuthRepo =
            ref.read(firebaseAuthenticationRepositoryProvider);
        return await firebaseAuthRepo.changeUserPassword(newPassword);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> updateCurrentUserPhotoURL(String newPhotoURL) async {
    try {
      const useFirebase = true;
      if (useFirebase) {
        try {
          final firebaseAuthRepo =
              ref.read(firebaseAuthenticationRepositoryProvider);
          firebaseAuthRepo.updateCurrentUserPhotoURL(newPhotoURL);
        } catch (e) {
          throw Exception(e);
        }
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String> getCurrentUserPhotoURL() async {
    try {
      const useFirebase = true;
      if (useFirebase) {
        final firebaseAuthRepo =
            ref.read(firebaseAuthenticationRepositoryProvider);
        return await firebaseAuthRepo.getCurrentUserPhotoURL();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
