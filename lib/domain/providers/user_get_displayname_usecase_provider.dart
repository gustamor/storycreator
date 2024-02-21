import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/domain/usecases/user_get_displayname.dart';

final getCurrentUserDiisplayNameUseCaseProvider = Provider<GetCurrentUserDisplayNameUseCase>((ref) {
  return GetCurrentUserDisplayNameUseCase(ref);
});