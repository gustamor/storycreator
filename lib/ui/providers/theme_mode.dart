import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/ui/themes/colors.dart';

final themeProvider = StateProvider<AppTheme>((ref) {
  return AppTheme.darkTheme; // Tema predeterminado
});