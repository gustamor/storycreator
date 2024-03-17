





import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/domain/usecases/authentication_user/user_check_email_verified.dart';

final checkAccountVerifiedUseCaseProvider =
    Provider<CheckAccountVerifiedUseCase>((ref) {
  return CheckAccountVerifiedUseCase(ref);
});
