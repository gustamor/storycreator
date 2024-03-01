import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/domain/usecases/authentication_user/user_create_user.dart';

final createUserUseCaseProvider = Provider<CreateUserUseCase>((ref) {
  return CreateUserUseCase(ref);
});