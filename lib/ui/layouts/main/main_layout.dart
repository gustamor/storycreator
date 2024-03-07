import 'package:flutter/cupertino.dart';
import 'package:story_creator/ui/abstract/responsive/responsive_stateless_screen.dart';
import 'package:story_creator/ui/layouts/main/screens/main_landscape_screen.dart';
import 'package:story_creator/ui/layouts/main/screens/main_portrait_screen.dart';

class MainLayout extends ResponsiveStatelessScreen {
  static String route = '/main';
  const MainLayout({super.key});

  @override
  Widget buildLandscape(BuildContext context) {
    return const  MainLandscapeScreen();
  }

  @override
  Widget buildPortrait(BuildContext context) {
    return const  MainPortraitScreen();
  }
}
