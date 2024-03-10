import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/domain/usecases/authentication_user/user_get_photo_url.dart';

final getCurrentUserPhotoURLUseCaseProvider = Provider<GetCurrentUserPhotoUrlUseCase>((ref) {
  return GetCurrentUserPhotoUrlUseCase(ref);
});