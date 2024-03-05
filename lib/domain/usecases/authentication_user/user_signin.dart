import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/data/services/authentication_service.dart';
import 'package:story_creator/ui/models/ui_user.dart';

class SignInUseCase {
  final Ref ref;

  SignInUseCase(this.ref);

  Future<UiUser?> invoke(String email, String password) async {
    try {
      final authService = ref.read(authenticationServiceProvider);

    final datauser = await authService.signIn(email, password);
    if (datauser != null) {
    return  UiUser(id: datauser.id,
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
