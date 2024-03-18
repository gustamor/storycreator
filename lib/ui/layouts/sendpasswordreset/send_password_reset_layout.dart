
import 'package:flutter/cupertino.dart';
import 'package:story_creator/ui/abstract/responsive/responsive_stateful_screen.dart';
import 'package:story_creator/ui/layouts/sendpasswordreset/screens/send_password_reset_landscape_screen.dart';
import 'package:story_creator/ui/layouts/sendpasswordreset/screens/send_password_reset_portrait_screen.dart';

class SendPasswordResetLinkLayout extends ResponsiveStatefulScreen {
  static String route = '/password/reset';
  const SendPasswordResetLinkLayout({super.key});

  @override
  Widget buildLandscape(BuildContext context) {
    return const SendPasswordResetLinkLandscapeScreen();
  }

  @override
  Widget buildPortrait(BuildContext context) {
    return const SendPasswordResetLinkPortraitScreen();
  } 
}
