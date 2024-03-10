import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:story_creator/ui/layouts/signin/screens/sign_portrait_screen.dart';

void main() {
  group("sign in screen portrait widgets", () {
    testWidgets('should sign screen scaffold widget exists',
        (WidgetTester tester) async {
      await tester.pumpWidget(
         const ProviderScope(
           child: CupertinoApp(
            home: ScreenUtilInit(
              child: SignPortraitScreen(),
            ),
                   ),
         ),
      );
      await tester.pumpAndSettle();
      final scaffoldFinder = find.byKey(const Key('scaffold_sign_portrait'));
      expect(scaffoldFinder, findsOneWidget);
    });

    testWidgets('should sign screen navigation bar widget exists',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: CupertinoApp(
            home: ScreenUtilInit(
              child: SignPortraitScreen(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final navTitleFinder = find.byKey(const Key('sign_nav_title'));
      expect(navTitleFinder, findsOneWidget);
    });

    testWidgets('should sign screen password text field  widget exists',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: CupertinoApp(
            home: ScreenUtilInit(
              child: SignPortraitScreen(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final passwordFieldFinder = find.byKey(const Key('passwordField'));
      expect(passwordFieldFinder, findsOneWidget);
    });

    testWidgets('should sign screen email text field widget exists',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: CupertinoApp(
            home: ScreenUtilInit(
              child: SignPortraitScreen(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final emailFieldFinder = find.byKey(const Key('emailField'));
      expect(emailFieldFinder, findsOneWidget);
    });

    testWidgets('should sign screen create account button widget exists',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: CupertinoApp(
            home: ScreenUtilInit(
              child: SignPortraitScreen(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final createAccountButtonFinder =
          find.byKey(const Key('create_account_button'));
      expect(createAccountButtonFinder, findsOneWidget);
    });

    testWidgets('should sign screen login button widget exists',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: CupertinoApp(
            home: ScreenUtilInit(
              child: SignPortraitScreen(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final loginButtonFinder = find.byKey(const Key('log_in_button'));
      expect(loginButtonFinder, findsOneWidget);
    });

    testWidgets('should form field widget exists', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: CupertinoApp(
            home: ScreenUtilInit(
              child: SignPortraitScreen(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final Finder emailField = find.byKey(const Key('emailField'));
      final Finder passwordField = find.byKey(const Key('passwordField'));
      await tester.enterText(emailField, 'test@example.com');
      await tester.enterText(passwordField, '12345');
      await tester.pump();
    });
    testWidgets('should log_in_button widget works',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: CupertinoApp(
            home: ScreenUtilInit(
              child: SignPortraitScreen(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final Finder submitButton = find.byKey(const Key('log_in_button'));
      await tester.tap(submitButton);
      await tester.pump();
    });

  });
}
