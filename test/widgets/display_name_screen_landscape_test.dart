import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:story_creator/ui/layouts/updateDisplayName/screens/update_display_name_landscape.dart';

void main() {
  group("displayname screen landscape widgets", () {
    testWidgets('should display name landscape screen scaffold widget exists',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: CupertinoApp(
            home: ScreenUtilInit(
              child: UpdateDisplayNameLandscapeScreen(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      final scaffoldFinder =
          find.byKey(const Key('displayname_scaffold_landscape'));
      expect(scaffoldFinder, findsOneWidget);
    });
  });

  testWidgets('should display name landscape screen text one widget exists',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: CupertinoApp(
          home: ScreenUtilInit(
            child: UpdateDisplayNameLandscapeScreen(),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    final textFinder = find.byKey(const Key('display_name_label_landscape'));
    expect(textFinder, findsOneWidget);
  });
  testWidgets('should display name landscape screen text field widget exists',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: CupertinoApp(
          home: ScreenUtilInit(
            child: UpdateDisplayNameLandscapeScreen(),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    final textFieldFinder =
        find.byKey(const Key('display_name_field_landscape'));
    expect(textFieldFinder, findsOneWidget);
  });

  testWidgets('should display name landscape screen button widget exists',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: CupertinoApp(
          home: ScreenUtilInit(
            child: UpdateDisplayNameLandscapeScreen(),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    final buttonFinder = find.byKey(const Key('display_name_button_landscape'));
    expect(buttonFinder, findsOneWidget);
  });

  testWidgets('should display name landscape screen gesture exist',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: CupertinoApp(
          home: ScreenUtilInit(
            child: UpdateDisplayNameLandscapeScreen(),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    final gestureFinder = find.byKey(const Key('displayname_gesture_landscape'));
    expect(gestureFinder, findsOneWidget);
  });




}
