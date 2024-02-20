// Definición del provider para FirebaseAuthenticationRepository
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/data/repositories/firebase_authentication_repository.dart';

final firebaseAuthenticationRepositoryProvider = Provider<FirebaseAuthenticationRepository>((ref) {
  return FirebaseAuthenticationRepository(ref);
});

