import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/data/services/authentication_service.dart';

class GetCurrentUserDisplayNameUseCase {
  final Ref ref;

  GetCurrentUserDisplayNameUseCase(this.ref);

  Future<String> invoke() async {
    try {
      final authService = ref.read(authenticationServiceProvider);
      return await authService.getCurrentUserDisplayName();
    } catch (e) {
      throw Exception(e);
    }
  }
}
