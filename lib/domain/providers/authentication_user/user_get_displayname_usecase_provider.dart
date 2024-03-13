import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/domain/usecases/authentication_user/user_get_displayname.dart';

final getCurrentUserDisplayNameUseCaseProvider =
    Provider<GetCurrentUserDisplayNameUseCase>((ref) {
  return GetCurrentUserDisplayNameUseCase(ref);
});
