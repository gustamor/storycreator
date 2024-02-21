import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/domain/usecases/user_reset_password.dart';

final resetUserPasswordUseCaseProvider =
    Provider<ResetUserPasswordUseCase>((ref) {
  return ResetUserPasswordUseCase(ref);
});
