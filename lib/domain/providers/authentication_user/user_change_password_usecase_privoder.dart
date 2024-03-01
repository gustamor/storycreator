
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/domain/usecases/authentication_user/user_change_password.dart';

final changeUserPasswordUseCaseProvider = Provider<ChangeUserPasswordUseCase>((ref) {
  return ChangeUserPasswordUseCase(ref);
});
