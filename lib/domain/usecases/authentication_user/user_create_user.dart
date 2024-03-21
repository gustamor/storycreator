import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/data/services/authentication_service.dart';
import 'package:story_creator/ui/models/ui_user.dart';

class CreateUserUseCase {
  final Ref ref;

  CreateUserUseCase(this.ref);

  Future<UiUser?> invoke(String email, String password) async {
    try {
      final authService = ref.read(authenticationServiceProvider);
       final dataUser = await authService.createUserWithEmailAndPassword(email, password);
      if (dataUser != null) {
        return UiUser(id: dataUser.id,
            email: dataUser.email,
            userName: dataUser.userName,
            isLogged: dataUser.isLogged);
      } else {
         throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
