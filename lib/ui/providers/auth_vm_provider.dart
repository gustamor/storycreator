
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/ui/layouts/vm/auth_viewmodel.dart';

final authViewModelProvider = Provider<AuthViewModel>((ref) {
  return AuthViewModel(ref);
});