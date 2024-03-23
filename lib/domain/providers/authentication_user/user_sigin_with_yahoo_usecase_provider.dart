import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/domain/usecases/authentication_user/user_signin_with_yahoo.dart';

final signInWithYahooUseCaseProvider =
    Provider<SignInWithYahooUseCase>((ref) {
  return SignInWithYahooUseCase(ref);
});
