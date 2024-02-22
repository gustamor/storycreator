import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/domain/usecases/user_get_displayname.dart';

final getCurrentUserPhotoURLUseCaseProvider =
    Provider<GetCurrentUserDisplayNameUseCase>((ref) {
  return GetCurrentUserDisplayNameUseCase(ref);
});
