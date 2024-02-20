
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provides an instance of [FirebaseAuth].
///
/// Grants access to the FirebaseAuth service, enabling user authentication and session management
/// across the entire application.
final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});
