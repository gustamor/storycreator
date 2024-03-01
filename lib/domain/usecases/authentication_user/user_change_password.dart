
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/data/services/authentication_service.dart';

class ChangeUserPasswordUseCase {
  final Ref ref;

  ChangeUserPasswordUseCase(this.ref);

  Future<void> invoke(String password) async {
    try {
      final authService = ref.read(authenticationServiceProvider);
      return authService.changeUserPassword(password);
    } catch (e) {
      throw Exception(e);
    }
  }
}
