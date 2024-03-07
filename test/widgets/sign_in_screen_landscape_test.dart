import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:story_creator/ui/layouts/signin/screens/sign_landscape_screen.dart';

void main() {
  group("sign in screen landscape widgets", () {
    testWidgets('scaffold_sign_landscape widget should exists',
        (WidgetTester tester) async {
      await tester.pumpWidget(
         ProviderScope(
           child: CupertinoApp(
            home: ScreenUtilInit(
              child: SignLandscapeScreen(),
            ),
                   ),
         ),
      );
      await tester.pumpAndSettle();
      final scaffoldFinder = find.byKey(const Key('scaffold_sign_landscape'));
      expect(scaffoldFinder, findsOneWidget);
    });

    testWidgets('sign_nav_titleL widget should exists',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            ProviderScope(
              child: CupertinoApp(
                home: ScreenUtilInit(
                  child: SignLandscapeScreen(),
                ),
              ),
            ),
          );
      await tester.pumpAndSettle();
      final navBarFinder = find.byKey(const Key('sign_nav_titleL'));
      expect(navBarFinder, findsOneWidget);
    });

    testWidgets('imageBoxL widget should exists', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: CupertinoApp(
            home: ScreenUtilInit(
              child: SignLandscapeScreen(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      final imageBoxFinder = find.byKey(const Key('imageBoxL'));
      expect(imageBoxFinder, findsOneWidget);
    });

    testWidgets('imageAssetL widget should exists',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            ProviderScope(
              child: CupertinoApp(
                home: ScreenUtilInit(
                  child: SignLandscapeScreen(),
                ),
              ),
            ),
          );
      await tester.pumpAndSettle();
      final imageAssetFinder = find.byKey(const Key('imageAssetL'));
      expect(imageAssetFinder, findsOneWidget);
    });

    testWidgets('emailFieldL widget should exists',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            ProviderScope(
              child: CupertinoApp(
                home: ScreenUtilInit(
                  child: SignLandscapeScreen(),
                ),
              ),
            ),
          );
      await tester.pumpAndSettle();
      final emailFieldFinder = find.byKey(const Key('emailFieldL'));
      expect(emailFieldFinder, findsOneWidget);
    });

    testWidgets('passwordFieldL widget should exists',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            ProviderScope(
              child: CupertinoApp(
                home: ScreenUtilInit(
                  child: SignLandscapeScreen(),
                ),
              ),
            ),
          );
      await tester.pumpAndSettle();
      final passwordFieldFinder = find.byKey(const Key('passwordFieldL'));
      expect(passwordFieldFinder, findsOneWidget);
    });

    testWidgets('create_account_buttonL widget should exists',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            ProviderScope(
              child: CupertinoApp(
                home: ScreenUtilInit(
                  child: SignLandscapeScreen(),
                ),
              ),
            ),
          );
      await tester.pumpAndSettle();
      final createAccountButtonFinder =
          find.byKey(const Key('create_account_buttonL'));
      expect(createAccountButtonFinder, findsOneWidget);
    });

    testWidgets('log_in_buttonL widget should exists',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            ProviderScope(
              child: CupertinoApp(
                home: ScreenUtilInit(
                  child: SignLandscapeScreen(),
                ),
              ),
            ),
          );
      await tester.pumpAndSettle();
      final loginButtonFinder = find.byKey(const Key('log_in_buttonL'));
      expect(loginButtonFinder, findsOneWidget);
    });

    testWidgets('should form field widget exists', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: CupertinoApp(
            home: ScreenUtilInit(
              child: SignLandscapeScreen(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final Finder emailField = find.byKey(const Key('emailFieldL'));
      final Finder passwordField = find.byKey(const Key('passwordFieldL'));
      await tester.enterText(emailField, 'test@example.com');
      await tester.enterText(passwordField, '12345');
      await tester.pump();
    });

    testWidgets('should log_in_button widget works',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            ProviderScope(
              child: CupertinoApp(
                home: ScreenUtilInit(
                  child: SignLandscapeScreen(),
                ),
              ),
            ),
          );
      await tester.pumpAndSettle();
      final Finder submitButton = find.byKey(const Key('log_in_buttonL'));
      await tester.tap(submitButton);
      await tester.pump();
    });

  });
}


final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return MockFirebaseAuth(
    mockUser: MockUser(isAnonymous: false, uid: 'someuid', email: 'test@example.com'),
    // Puedes ajustar la excepción según lo que quieras probar
   // exception: FirebaseAuthException(code: 'user-not-found'),
  );
});

