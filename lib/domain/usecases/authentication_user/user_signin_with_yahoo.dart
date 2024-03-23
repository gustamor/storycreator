
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/data/exceptions/firebase_authenticaton_exceptions.dart';
import 'package:story_creator/data/services/authentication_service.dart';
import 'package:story_creator/ui/models/ui_user.dart';

class SignInWithYahooUseCase {
  final Ref ref;

  SignInWithYahooUseCase(this.ref);

  Future<UiUser?> invoke() async {
    try {
      final authService = ref.read(authenticationServiceProvider);

      final datauser = await authService.signInWithYahooProvider();
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
