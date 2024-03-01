import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/data/services/authentication_service.dart';

class SendEmailVerificationUseCase {
  final Ref ref;

  SendEmailVerificationUseCase(this.ref);

  Future<void> invoke() async {
    try {
      final authService = ref.read(authenticationServiceProvider);
      return authService.sendEmailVerification();
    } catch (e) {
      throw Exception(e);
    }
  }
}
