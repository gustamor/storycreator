import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/data/services/authentication_service.dart';

class ResetUserPasswordUseCase {
  final Ref ref;

  ResetUserPasswordUseCase(this.ref);

  Future<void> invoke(String email) async {
    try {
      final authService = ref.read(authenticationServiceProvider);
      return authService.sendEmailResetPassword(email);
    } catch (e) {
      throw Exception(e);
    }
  }
}
