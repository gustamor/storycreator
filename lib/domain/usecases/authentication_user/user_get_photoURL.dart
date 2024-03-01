
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/data/services/authentication_service.dart';

class GetCurrentUserPhotoURLUseCase {
  final Ref ref;

  GetCurrentUserPhotoURLUseCase(this.ref);

  Future<String> invoke() async {
    try {
      final authService = ref.read(authenticationServiceProvider);
      return await authService.getCurrentUserPhotoURL();
    } catch (e) {
      throw Exception(e);
    }
  }
}
