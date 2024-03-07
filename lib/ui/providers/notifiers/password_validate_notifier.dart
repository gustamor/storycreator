
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/ui/core/error_validate_password_enum.dart';
import 'package:story_creator/ui/providers/password_textcontroller_provider.dart';

class PasswordValidatorNotifier extends StateNotifier<PasswordValidationState> {
  PasswordValidatorNotifier() : super(PasswordValidationState());

  void validatePassword(String password) {
    List<ErrorValidatePassword> errors = [];

    RegExp regex = RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)(?=.*[A-Z]).{8,}$');
    RegExp regexEightCharacters = RegExp(r'.{8,}');
    RegExp regexContainsLetters = RegExp(r'[a-zA-Z]');
    RegExp regexContainsNumbers = RegExp(r'\d');
    RegExp regexContainsUppercase = RegExp(r'[A-Z]');

    if (password.isEmpty) {
      errors.add(ErrorValidatePassword.isEmpty);
    }
    if (!regex.hasMatch(password)) {
      if (!regexContainsLetters.hasMatch(password)) {
        errors.add(ErrorValidatePassword.noLetter);
      }
      if (!regexContainsNumbers.hasMatch(password)) {
        errors.add(ErrorValidatePassword.noNumber);
      }
      if (!regexEightCharacters.hasMatch(password)) {
        errors.add(ErrorValidatePassword.lessLength);
      }
      if (!regexContainsUppercase.hasMatch(password)) {
        errors.add(ErrorValidatePassword.noUpperCase);
      }
    }
    state = PasswordValidationState(errors: errors);
  }
}
