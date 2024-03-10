
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/data/services/authentication_service.dart';

class GetCurrentUserPhotoUrlUseCase {
  final Ref ref;

  GetCurrentUserPhotoUrlUseCase(this.ref);

  Future<String> invoke() async {
    try {
      final authService = ref.read(authenticationServiceProvider);
      return await authService.getCurrentUserPhotoURL();
    } catch (e) {
      throw Exception(e);
    }
  }
}
