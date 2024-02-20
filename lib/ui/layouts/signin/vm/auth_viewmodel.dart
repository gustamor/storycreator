import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/domain/providers/user_createuser_usecase_provider.dart';
import 'package:story_creator/domain/providers/user_logout_usecase_provider.dart';
import 'package:story_creator/domain/providers/user_sendemail_verification_usercase_provider.dart';
import 'package:story_creator/domain/providers/user_signin_usecase_provider.dart';
import 'package:story_creator/domain/usecases/user_send_email_verification.dart';
import 'package:story_creator/ui/models/ui_user.dart';

class AuthViewModel {
  final Ref ref;

  AuthViewModel(this.ref);

  Future<UiUser?> signIn(String email, String password) async {
    try {
      final signInUseCase = ref.read(signInUseCaseProvider);
      return await signInUseCase.invoke(email, password);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<UiUser?> createUser(String email, String password) async {
    try {
      final createUserUseCase = ref.read(createUserUseCaseProvider);
      return await createUserUseCase.invoke(email, password);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> logout() async {
    try {
      final logoutUseCase = ref.read(logoutUseCaseProvider);
      return await logoutUseCase.invoke();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      final sendEmailVerificationUseCase =
         ref.read(sendEmailVerificationUseCaseProvider);
      return await sendEmailVerificationUseCase.invoke();
  
    } catch (e) {
      throw Exception(e);
    }
  }
}
