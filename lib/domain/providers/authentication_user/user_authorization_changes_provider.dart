import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/domain/usecases/authentication_user/user_authorization_changes.dart';

final userAuthChangesProviderUseCase = StreamProvider<User?>((ref) {
  return UserAuthorizationChangesUseCase(ref).invoke();
});
