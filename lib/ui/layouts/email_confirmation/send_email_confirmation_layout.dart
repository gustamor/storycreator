import 'package:flutter/cupertino.dart';
import 'package:story_creator/ui/abstract/responsive/responsive_stateful_screen.dart';
import 'package:story_creator/ui/layouts/email_confirmation/screens/send_email_confirmation_landscape_screen.dart';
import 'package:story_creator/ui/layouts/email_confirmation/screens/send_email_confirmation_portrait_screen.dart';

class SendEmailConfirmationLayout extends ResponsiveStatefulScreen {
  static String route = '/email_confirmation';

  const SendEmailConfirmationLayout({super.key});

  @override
  Widget buildLandscape(BuildContext context) {
    return const SendEmailConfirmationLandscapeScreen();
  }

  @override
  Widget buildPortrait(BuildContext context) {
    return const SendEmailConfirmationPortraitScreen();
  }
}
