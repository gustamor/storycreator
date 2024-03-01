


import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/services/authentication_service.dart';

class UpdateCurrentUserDisplayNameUseCase {
  final Ref ref;

  UpdateCurrentUserDisplayNameUseCase(this.ref);

  Future<void> invoke(String displayName) async {
    try {
      final authService = ref.read(authenticationServiceProvider);
      return authService.updateCurrentUserDisplayName(displayName);
    } catch (e) {
      throw Exception(e);
    }
  }
}
