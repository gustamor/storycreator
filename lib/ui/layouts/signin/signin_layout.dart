import 'package:flutter/cupertino.dart';
import 'package:story_creator/ui/abstract/responsive/responsive_stateless_screen.dart';
import 'package:story_creator/ui/layouts/signin/screens/sign_landscape_screen.dart';
import 'package:story_creator/ui/layouts/signin/screens/sign_portrait_screen.dart';

class SignInLayout extends ResponsiveStatelessScreen {
  static String route = '/signin';
  const SignInLayout({super.key});

  @override
  Widget buildLandscape(BuildContext context) {
    return SignLandscapeScreen();
  }

  @override
  Widget buildPortrait(BuildContext context) {
    return SignPortraitScreen();
  }
}
