import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/ui/core/error_validate_password_enum.dart';


final passwordControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());

class PasswordValidationState {
  final List<ErrorValidatePassword> errors;
  PasswordValidationState({this.errors = const []});
  bool get hasErrors => errors.isNotEmpty;
}
