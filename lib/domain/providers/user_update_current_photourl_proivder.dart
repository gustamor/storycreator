import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/domain/usecases/user_update_current_photoURL.dart';

final updatePhotoURLCurrentUserUseCaseProvider = Provider<UpdateCurrentUserPhotoURLUseCase>((ref) {
  return UpdateCurrentUserPhotoURLUseCase(ref);
});