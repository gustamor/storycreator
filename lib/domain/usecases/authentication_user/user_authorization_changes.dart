import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/data/providers/firebase_authentication_changes_provider.dart';

class UserAuthorizationChangesUseCase {
  final Ref ref;

  UserAuthorizationChangesUseCase(this.ref);

  Stream<User?> invoke() async* {
    try {
      final authChanges = ref.watch(authStateChangesProvider);
      yield* authChanges;
    } catch (e) {
      throw Exception(e);
    }
  }
}
