import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/domain/usecases/authentication_user/user_signin_with_facebook.dart';

final signInWithFacebookUseCaseProvider = Provider<SignInWithFacebookUseCase>((ref) {
  return SignInWithFacebookUseCase(ref);
});