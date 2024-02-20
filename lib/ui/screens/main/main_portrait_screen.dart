import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/ui/providers/theme_mode.dart';
import 'package:story_creator/ui/themes/colors.dart';

class MainPortraitScreen extends ConsumerWidget {
  const MainPortraitScreen({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isTablet = MediaQuery.of(context).size.shortestSide >= 600;

    return CupertinoPageScaffold(
      key: const Key("main_scaffold"),
      navigationBar: CupertinoNavigationBar(
        leading: const Icon(CupertinoIcons.back),
        previousPageTitle: "Exit",
        middle: Text(
          title,
          key: const Key("main_text_title"),
        ),
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: CupertinoButton(
            key: const Key('changeThemeButton'),
            onPressed: () {
              ref.read(themeProvider.notifier).state =
                  ref.read(themeProvider) == AppTheme.lightTheme
                      ? AppTheme.darkTheme
                      : AppTheme.lightTheme;
            },
            child: Container(
                color: const Color(0x00ff1133),
                child: const Text('Cambiar Tema')),
          ),
        ),
        Center(
          child: ElevatedButton(
            child: const Text("Switch Orentation"),
            onPressed: () {
              if (isTablet) {
              } else {
                if (MediaQuery.of(context).orientation ==
                    Orientation.portrait) {
                  //if Orientation is portrait then set to landscape mode
                  SystemChrome.setPreferredOrientations([
                    DeviceOrientation.landscapeLeft,
                    DeviceOrientation.landscapeRight,
                  ]);
                } else {
                  //if Orientation is landscape then set to portrait
                  SystemChrome.setPreferredOrientations([
                    DeviceOrientation.portraitDown,
                    DeviceOrientation.portraitUp,
                  ]);
                }
              }
            },
          ),
        )
      ]), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class LifecycleEventHandler extends WidgetsBindingObserver {
  final AsyncCallback? detachedCallBack;

  LifecycleEventHandler({this.detachedCallBack});

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached) {
      detachedCallBack?.call();
    }
  }
}
