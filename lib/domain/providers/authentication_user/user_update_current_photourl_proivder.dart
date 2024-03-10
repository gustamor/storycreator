import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/domain/usecases/authentication_user/user_update_current_photo_url.dart';

final updatePhotoURLCurrentUserUseCaseProvider = Provider<UpdateCurrentUserPhotoURLUseCase>((ref) {
  return UpdateCurrentUserPhotoURLUseCase(ref);
});