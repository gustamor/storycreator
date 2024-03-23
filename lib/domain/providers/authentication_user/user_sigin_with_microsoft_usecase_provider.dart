import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/domain/usecases/authentication_user/user_signin_with_microsoft.dart';

final signInWithMicrosoftUseCaseProvider =
    Provider<SignInWithMicrosoftUseCase>((ref) {
  return SignInWithMicrosoftUseCase(ref);
});
