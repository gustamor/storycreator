
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/domain/usecases/authentication_user/user_signin.dart';

final signInUseCaseProvider = Provider<SignInUseCase>((ref) {
  return SignInUseCase(ref);
});