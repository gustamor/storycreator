import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:story_creator/ui/layouts/email_confirmation/screens/send_email_confirmation_landscape_screen.dart';
import 'package:story_creator/ui/layouts/email_confirmation/screens/send_email_confirmation_portrait_screen.dart';

void main() {
  group("send email verificacion screen portrait widgets", () {
    testWidgets(
        'should scaffold widget exists at send confirm email portrait screen ',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: CupertinoApp(
            home: ScreenUtilInit(
              child: SendEmailConfirmationPortraitScreen(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      final scaffoldFinder =
          find.byKey(const Key('email_link_scaffold_portrait'));
      expect(scaffoldFinder, findsOneWidget);
    });

    testWidgets(
        'should only one text widget exists in send email verification portrait screen',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: CupertinoApp(
            home: ScreenUtilInit(
              child: SendEmailConfirmationPortraitScreen(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      final textFinder = find.byKey(const Key('email_link_title_portrait'));
      expect(textFinder, findsOneWidget);
    });

    testWidgets('should portrait screen button widget exists',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: CupertinoApp(
            home: ScreenUtilInit(
              child: SendEmailConfirmationPortraitScreen(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      final textFieldFinder =
          find.byKey(const Key('email_link_button_portrait'));
      expect(textFieldFinder, findsOneWidget);
    });
  });
  group("send email verificacion screen landscape widgets", () {
    testWidgets(
        'should scaffold widget exists at send confirm email landscape screen ',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: CupertinoApp(
            home: ScreenUtilInit(
              child: SendEmailConfirmationLandscapeScreen(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      final scaffoldFinderL =
          find.byKey(const Key('email_link_scaffold_landscape'));
      expect(scaffoldFinderL, findsOneWidget);
    });

    testWidgets(
        'should only one title widget exists in send email verification landspace screen',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: CupertinoApp(
            home: ScreenUtilInit(
              child: SendEmailConfirmationLandscapeScreen(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      final textFinder = find.byKey(const Key('email_link_title_landscape'));
      expect(textFinder, findsOneWidget);
    });

  testWidgets(
        'should only one text widget exists in send email verification landspace screen',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: CupertinoApp(
            home: ScreenUtilInit(
              child: SendEmailConfirmationLandscapeScreen(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      final textFinder = find.byKey(const Key('email_link_text_landscape'));
      expect(textFinder, findsOneWidget);
    });


    testWidgets('should landscape screen button widget exists',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: CupertinoApp(
            home: ScreenUtilInit(
              child: SendEmailConfirmationLandscapeScreen(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      final textFieldFinder =
          find.byKey(const Key('email_link_confirmation_landscape'));
      expect(textFieldFinder, findsOneWidget);
    });
  });
}
