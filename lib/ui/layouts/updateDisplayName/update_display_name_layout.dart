import 'package:flutter/cupertino.dart';
import 'package:story_creator/ui/abstract/responsive/responsive_stateless_screen.dart';
import 'package:story_creator/ui/layouts/updateDisplayName/screens/update_display_name_landscape.dart';
import 'package:story_creator/ui/layouts/updateDisplayName/screens/update_display_name_portrait.dart';

class UpdateDisplayNameLayout extends ResponsiveStatelessScreen {
  static String route = '/display_name';
  const UpdateDisplayNameLayout({super.key});

  @override
  Widget buildLandscape(BuildContext context) {
    return UpdateDisplayNameLandscapeScreen();
  }

  @override
  Widget buildPortrait(BuildContext context) {
    return  UpdateDisplayNamePortraitScreen();
  }
}
