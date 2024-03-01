import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/domain/usecases/authentication_user/user_logout.dart';

final logoutUseCaseProvider = Provider<LogoutUseCase>((ref) {
  return LogoutUseCase(ref);
});
