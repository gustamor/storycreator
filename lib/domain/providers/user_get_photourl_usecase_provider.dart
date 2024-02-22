import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/domain/usecases/user_get_photoURL.dart';

final getCurrentUserPhotoURLUseCaseProvider = Provider<GetCurrentUserPhotoURLUseCase>((ref) {
  return GetCurrentUserPhotoURLUseCase(ref);
});