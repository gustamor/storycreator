import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/data/di/firebase_authentication_module.dart';

class AuthenticationChangesService {
  final Ref ref;

  AuthenticationChangesService({required this.ref});
  Stream<User?> authStateChanges() {
    const useFirebase = true;
    if (useFirebase) {
      final firebaseAuth = ref.watch(firebaseAuthProvider);
      return firebaseAuth.authStateChanges();
    }
  }
}
