import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:story_creator/ui/layouts/updateDisplayName/screens/update_display_name_portrait.dart';

void main() {
  group("displayname screen portrait widgets", () {
    testWidgets('should scaffold widget exists at enter display name portrait screen ',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: CupertinoApp(
            home: ScreenUtilInit(
              child: UpdateDisplayNamePortraitScreen(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      final scaffoldFinder =
          find.byKey(const Key('displayname_scaffold_portrait'));
      expect(scaffoldFinder, findsOneWidget);
    });
  });

  testWidgets('should only one text widget exists in display name portrait screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: CupertinoApp(
          home: ScreenUtilInit(
            child: UpdateDisplayNamePortraitScreen(),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    final textFinder = find.byKey(const Key('display_name_label_portrait'));
    expect(textFinder, findsOneWidget);
  });
  testWidgets('should display name portrait screen text field widget exists',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: CupertinoApp(
          home: ScreenUtilInit(
            child: UpdateDisplayNamePortraitScreen(),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    final textFieldFinder =
        find.byKey(const Key('display_name_field_portrait'));
    expect(textFieldFinder, findsOneWidget);
  });

  testWidgets('should display name portrait screen button widget exists',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: CupertinoApp(
          home: ScreenUtilInit(
            child: UpdateDisplayNamePortraitScreen(),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    final buttonFinder = find.byKey(const Key('display_name_button_portrait'));
    expect(buttonFinder, findsOneWidget);
  });

  testWidgets('should display name landscape screen gesture exist',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: CupertinoApp(
          home: ScreenUtilInit(
            child: UpdateDisplayNamePortraitScreen(),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    final gestureFinder = find.byKey(const Key('displayname_gesture_portrait'));
    expect(gestureFinder, findsOneWidget);
  });
}
