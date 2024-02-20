import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final passwordProvider = StateProvider<String>((ref) => '');
final passwordErrorProvider = StateProvider<String?>((ref) => null);
final passwordControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());

final passwordValidationProvider = Provider<bool>((ref) {
  final password = ref.watch(passwordProvider);
  String? error;
  RegExp regex = RegExp(
      r'^(?=.*\d)[A-Za-z\d]{8,}$'); // Un mínimo de ocho caracteres y al menos un número
  if (password.isEmpty) {
    error = 'Please enter your password';
    return false;
  } else if (!regex.hasMatch(password)) {
    error = 'Please enter a valid password';
    return false;
  } else {
    error = null;
  }
    ref.watch(passwordErrorProvider.notifier).update((state) => state = error);

  return error == null;
  // Retorna null si la contraseña es válida
});
