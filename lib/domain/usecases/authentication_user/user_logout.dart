import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/data/services/authentication_service.dart';
import 'package:story_creator/ui/providers/email_verification_provider.dart';
import 'package:story_creator/ui/providers/password_textcontroller_provider.dart';

class LogoutUseCase {
  final Ref ref;

  LogoutUseCase(this.ref);

  Future<void> invoke() async {
    try {
      final authService = ref.read(authenticationServiceProvider);
      return authService.logout();
    } catch (e) {
      throw Exception(e);
    }
  }
}
