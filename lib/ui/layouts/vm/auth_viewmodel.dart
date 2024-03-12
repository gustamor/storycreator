import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/domain/providers/authentication_user/user_change_password_usecase_privoder.dart';
import 'package:story_creator/domain/providers/authentication_user/user_createuser_usecase_provider.dart';
import 'package:story_creator/domain/providers/authentication_user/user_get_displayname_usecase_provider.dart';
import 'package:story_creator/domain/providers/authentication_user/user_get_photourl_usecase_provider.dart';
import 'package:story_creator/domain/providers/authentication_user/user_logout_usecase_provider.dart';
import 'package:story_creator/domain/providers/authentication_user/user_reset_password_usecase_provider.dart';
import 'package:story_creator/domain/providers/authentication_user/user_sendemail_verification_usercase_provider.dart';
import 'package:story_creator/domain/providers/authentication_user/user_signin_usecase_provider.dart';
import 'package:story_creator/domain/providers/authentication_user/user_update_current_displayname_provider.dart';
import 'package:story_creator/domain/providers/authentication_user/user_update_current_photourl_proivder.dart';
import 'package:story_creator/domain/usecases/authentication_user/user_get_displayname.dart';
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

  Future<void> resetUserPassword(String email) async {
    try {
      final resetUserPasswordUseCase =
          ref.read(resetUserPasswordUseCaseProvider);
      return await resetUserPasswordUseCase.invoke(email);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> updateDisplayNameCurrentUser(String displayName) async {
    try {
      final updateDisplayNameCurrentUserUseCase =
          ref.read(updateDisplayNameCurrentUserUseCaseProvider(displayName));
      if (updateDisplayNameCurrentUserUseCase != null) {
        return await updateDisplayNameCurrentUserUseCase.invoke(displayName);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String> getDisplayNameCurrentUser() async {
    try {
      final getCurrentUserDisplayNameUseCase =
          ref.read(getCurrentUserDisplayNameUseCaseProvider);
      final name = await getCurrentUserDisplayNameUseCase.invoke();
      if (name.isNotEmpty) {
        return name;
      } else {
        return "";
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> changeUserPassword(String newPassword) async {
    try {
      final changeUserPasswordUseCase =
          ref.read(changeUserPasswordUseCaseProvider);
      await changeUserPasswordUseCase.invoke(newPassword);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> updatePhotoURLCurrentUser(String newPhotoURL) async {
    try {
      final updatePhotoURLCurrentUserUseCase =
          ref.read(updatePhotoURLCurrentUserUseCaseProvider);
      return await updatePhotoURLCurrentUserUseCase.invoke(newPhotoURL);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String> getPhotoURLCurrentUser() async {
    try {
      final getCurrentUserPhotoURLUseCase =
          ref.read(getCurrentUserPhotoURLUseCaseProvider);
      return await getCurrentUserPhotoURLUseCase.invoke();
    } catch (e) {
      throw Exception(e);
    }
  }
}
