import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/data/services/authentication_service.dart';
import 'package:story_creator/ui/models/ui_user.dart';

class SignInWithFacebookUseCase {
  final Ref ref;

  SignInWithFacebookUseCase(this.ref);

  Future<UiUser?> invoke() async {
    try {
      final authService = ref.read(authenticationServiceProvider);

      final datauser = await authService.signInWithFacebookProvider();
      if (datauser != null) {
        return UiUser(
            id: datauser.id,
            email: datauser.email,
            userName: datauser.userName,
            isLogged: datauser.isLogged);
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
