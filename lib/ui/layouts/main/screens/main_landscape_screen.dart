import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainLandscapeScreen extends ConsumerWidget {
  const MainLandscapeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const CupertinoPageScaffold(
      key:  Key("scaffold_main_landscape"),
      navigationBar: CupertinoNavigationBar(
        leading:  Icon(CupertinoIcons.back),
        previousPageTitle: "Exit",
        middle: Text(
          "Main Screen",
          key:  Key("main_nav_title_landscape"),
        ),
      ),
      child: SingleChildScrollView());

  }
}