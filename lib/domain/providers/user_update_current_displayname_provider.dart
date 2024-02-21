import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/domain/usecases/user_update_current_displayame.dart';

final updateDisplayNameCurrentUserUseCaseProvider = Provider<UpdateCurrentUserDisplayNameUseCase>((ref) {
  return UpdateCurrentUserDisplayNameUseCase(ref);
});