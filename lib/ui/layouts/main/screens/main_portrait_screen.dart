import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPortraitScreen extends ConsumerWidget {
  const MainPortraitScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const CupertinoPageScaffold(
      key:  Key("scaffold_main_portrait"),
      navigationBar: CupertinoNavigationBar(
        leading:  Icon(CupertinoIcons.back),
        previousPageTitle: "Exit",
        middle: Text(
          "Main Screen",
          key:  Key("main_nav_title"),
        ),
      ),
      child: SingleChildScrollView());
}
}