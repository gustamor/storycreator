
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/data/services/authentication_service.dart';

class UpdateCurrentUserPhotoURLUseCase {
  final Ref ref;

  UpdateCurrentUserPhotoURLUseCase(this.ref);

  Future<void> invoke(String displayName) async {
    try {
      final authService = ref.read(authenticationServiceProvider);
      return authService.updateCurrentUserPhotoURL(displayName);
    } catch (e) {
      throw Exception(e);
    }
  }
}
