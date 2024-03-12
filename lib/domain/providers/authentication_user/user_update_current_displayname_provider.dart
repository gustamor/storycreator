import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/domain/usecases/authentication_user/user_update_current_displayname.dart';

final updateDisplayNameCurrentUserUseCaseProvider = Provider.family<UpdateCurrentUserDisplayNameUseCase?, String>((ref, name) {
  if (name.isNotEmpty && name.length > 2) {
      return UpdateCurrentUserDisplayNameUseCase(ref);
  }
  return null;
});