import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:story_creator/ui/providers/theme_mode.dart';
import 'package:story_creator/ui/themes/colors.dart';

void main() {
  group('Theme Provider Tests', () {
    test("should have light theme as default", () async {
      final container = ProviderContainer();
      final theme = container.read(themeProvider);
      expect(theme, AppTheme.lightTheme);
    });

    test("should be able to change theme", () async {
      final container = ProviderContainer();
      final theme = container.read(themeProvider);
      expect(theme, AppTheme.lightTheme);

      container.read(themeProvider.notifier).state = AppTheme.darkTheme;
      expect(container.read(themeProvider), AppTheme.darkTheme);
    });
  });

  test("should be able to change to dark theme", () async {
    final container = ProviderContainer();
    container
        .read(themeProvider.notifier)
        .update((state) => state = AppTheme.darkTheme);
    expect(container.read(themeProvider), AppTheme.darkTheme);
  });

  test("should be able to change to light theme", () async {
    final container = ProviderContainer();
    container
        .read(themeProvider.notifier)
        .update((state) => state = AppTheme.lightTheme);
    expect(container.read(themeProvider), AppTheme.lightTheme);
  });
}
