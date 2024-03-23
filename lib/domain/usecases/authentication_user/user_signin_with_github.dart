// ignore_for_file: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/data/exceptions/firebase_authenticaton_exceptions.dart';
import 'package:story_creator/data/services/authentication_service.dart';
import 'package:story_creator/ui/models/ui_user.dart';

class SignInWithGithubUseCase {
  final Ref ref;

  SignInWithGithubUseCase(this.ref);

  Future<UiUser?> invoke() async {
    try {
      final authService = ref.read(authenticationServiceProvider);

      final datauser = await authService.signInWithGithubProvider();
      if (datauser != null) {
        return UiUser(
            id: datauser.id,
            email: datauser.email,
            userName: datauser.userName,
            isLogged: datauser.isLogged);
      } else {
        throw UserNotFoundException();
      }
    } catch (e) {
      rethrow;
    }
  }
}
