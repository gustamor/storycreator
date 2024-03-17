import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/data/services/authentication_service.dart';

class CheckAccountVerifiedUseCase {
  final Ref ref;

  CheckAccountVerifiedUseCase(this.ref);

  Future<bool> invoke() async {
    try {
      final authService = ref.read(authenticationServiceProvider);
      return await authService.checkIfAccountIsVerified();
    } catch (e) {
      throw Exception(e);
    }
  }
}
