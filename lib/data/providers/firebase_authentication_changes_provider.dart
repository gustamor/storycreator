import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/data/services/authentication_changes_service.dart';

final authStateChangesProvider = Provider<Stream<User?>>((ref) {
  final authService = AuthenticationChangesService(ref: ref);
  return authService.authStateChanges();
});
