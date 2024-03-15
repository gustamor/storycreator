import 'package:flutter/cupertino.dart';
import 'package:story_creator/ui/abstract/responsive/responsive_stateless_screen.dart';
import 'package:story_creator/ui/layouts/loading/screen/loading_landscape_screen.dart';
import 'package:story_creator/ui/layouts/loading/screen/loading_portrait_screen.dart';

class LoadingLayout extends ResponsiveStatelessScreen {
  static String route = '/loading';
  const LoadingLayout({super.key});

  @override
  Widget buildLandscape(BuildContext context) {
    return const LoadingLandscapeScreen();
  }

  @override
  Widget buildPortrait(BuildContext context) {
    return const LoadingPortraitScreen();
  }
}
