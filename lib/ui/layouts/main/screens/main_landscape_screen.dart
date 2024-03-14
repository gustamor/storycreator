import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_down_button/pull_down_button.dart';
import 'package:story_creator/ui/layouts/signin/signin_layout.dart';
import 'package:story_creator/ui/providers/auth_vm_provider.dart';

class MainLandscapeScreen extends ConsumerWidget {
  const MainLandscapeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(authViewModelProvider);

    return CupertinoPageScaffold(
        key: const Key("scaffold_main_landscape"),
        navigationBar: CupertinoNavigationBar(
            leading: const Icon(CupertinoIcons.back),
            previousPageTitle: "Exit",
            middle: const Text(
              "Main Screen",
              key: Key("main_nav_title_landscape"),
            ),
            trailing: PullDownButton(
              itemBuilder: (context) => [
                PullDownMenuItem(
                  title: 'Close session',
                  onTap: () {
                    showCupertinoModalPopup<void>(
                        context: context,
                        builder: (BuildContext context) => CupertinoAlertDialog(
                              title: const Text('Alert'),
                              content: const Text('Proceed with logout?'),
                              actions: <CupertinoDialogAction>[
                                CupertinoDialogAction(
                                  /// This parameter indicates this action is the default,
                                  /// and turns the action's text to bold text.
                                  isDefaultAction: true,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('No'),
                                ),
                                CupertinoDialogAction(
                                  /// This parameter indicates the action would perform
                                  /// a destructive action such as deletion, and turns
                                  /// the action's text color to red.
                                  isDestructiveAction: true,
                                  onPressed: () {
                                    viewModel.logout().then(
                                          (value) =>
                                              Navigator.pushReplacementNamed(
                                                  context, SignInLayout.route),
                                        );
                                  },
                                  child: const Text('Yes'),
                                ),
                              ],
                            ));
                  },
                  icon: CupertinoIcons.square_arrow_left_fill,
                ),
                PullDownMenuActionsRow.medium(
                  items: [
                    PullDownMenuItem(
                      onTap: () {},
                      title: 'Share',
                      icon: CupertinoIcons.share_solid,
                    ),
                    PullDownMenuItem(
                      onTap: () {},
                      title: 'More',
                      icon: CupertinoIcons.circle_grid_3x3_fill,
                    ),
                  ],
                ),
              ],
              buttonBuilder: (context, showMenu) => CupertinoButton(
                onPressed: showMenu,
                padding: EdgeInsets.zero,
                child: const Icon(CupertinoIcons.person_fill),
              ),
            )),
        child: const SingleChildScrollView());
  }
}
