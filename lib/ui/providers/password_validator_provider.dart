import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/ui/providers/notifiers/password_validate_notifier.dart';
import 'package:story_creator/ui/providers/password_textcontroller_provider.dart';

final passwordValidatorProvider =
    StateNotifierProvider<PasswordValidatorNotifier, PasswordValidationState>(
        (ref) {
  return PasswordValidatorNotifier();
});

