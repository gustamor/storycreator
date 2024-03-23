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
      rethrow;
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
          rethrow;
        }
      }
    } catch (e) {
      rethrow;
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
          rethrow;
        }
      }
    } catch (e) {
      rethrow;
    }
  }


  Future<DataUser?> signInWithMicrosoftProvider() async {
    try {
      const useFirebase = true;
      if (useFirebase) {
        final firebaseAuthRepo =
            ref.read(firebaseAuthenticationRepositoryProvider);
        try {
          final user = await firebaseAuthRepo.signInWithMicrosoftProvider();
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
          rethrow;
        }
      }
    } catch (e) {
      rethrow;
    }
  }


  Future<DataUser?> signInWithYahooProvider() async {
    try {
      const useFirebase = true;
      if (useFirebase) {
        final firebaseAuthRepo =
            ref.read(firebaseAuthenticationRepositoryProvider);
        try {
          final user = await firebaseAuthRepo.signInWithYahooProvider();
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
          rethrow;
        }
      }
    } catch (e) {
      rethrow;
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
          rethrow;
        }
      }
    } catch (e) {
      rethrow;
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
        } catch (e) {
          rethrow;
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<DataUser?> signInWithFacebookProvider() async {
    try {
      const useFirebase = true;
      if (useFirebase) {
        final firebaseAuthRepo =
            ref.read(firebaseAuthenticationRepositoryProvider);
        try {
          final user = await firebaseAuthRepo.signInWithFacebookCredentials();
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
          rethrow;
        }
      }
    } catch (e) {
      rethrow;
    }
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
          rethrow;
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _logoutGoogleProvider() async {
    try {
      final googleAuth = await ref.read(googleCredentialsProvider.future);
      await googleAuth.signOut();
    } catch (e) {
      rethrow;
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
      rethrow;
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
          rethrow;
        }
      }
    } catch (e) {
      rethrow;
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
          rethrow;
        }
      }
    } catch (e) {
      rethrow;
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
      rethrow;
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
      rethrow;
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
          rethrow;
        }
      }
    } catch (e) {
      rethrow;
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
      rethrow;
    }
  }
}
