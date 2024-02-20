import 'package:email_validator/email_validator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final emailProvider = StateProvider<String>((ref) => '');
final emailErrorProvider = StateProvider<String?>((ref) => null);
final emailControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());

final emailValidationProvider = Provider.family<bool, String>((ref, email) {
  String? error;
  if (email.isEmpty) {
    error = 'Please enter your email';
  } else if (!EmailValidator.validate(email)) {
    error = 'Please enter a valid email';
  } else {
    error = null; // El email es válido
  }
  try {
    ref.read(emailErrorProvider.notifier).update((state) => state = error);
  } catch (e) {
    if (kDebugMode) {
      print("emailErrorProvider failed");
    }
  }

  return error == null;
});
