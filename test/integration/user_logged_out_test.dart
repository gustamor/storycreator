import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:story_creator/ui/layouts/main/screens/main_portrait_screen.dart';

void main() {
  group(
    'logout process',
    () {
      testWidgets(
        'should navigatoe to signin screen when log out',
        (tester) async {
          await tester.pumpWidget(
            const ProviderScope(
              child: CupertinoApp(
                home: ScreenUtilInit(
                  child: MainPortraitScreen(),
                ),
              ),
            ),
          );

          await tester.pumpAndSettle();
        },
      );
    },
  );
}
