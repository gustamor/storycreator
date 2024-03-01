import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/domain/usecases/authentication_user/user_update_current_displayame.dart';

final updateDisplayNameCurrentUserUseCaseProvider = Provider<UpdateCurrentUserDisplayNameUseCase>((ref) {
  return UpdateCurrentUserDisplayNameUseCase(ref);
});