import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:story_creator/firebase_options.dart';
import 'package:story_creator/ui/providers/theme_mode.dart';
import 'package:story_creator/ui/layouts/signin/signin_layout.dart';
import 'package:story_creator/ui/themes/colors.dart';
import 'core/initializers.dart';

final initialize = Init();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //await initialize.setEnabledSystemUIMode();
  await initialize.setDeviceOrientation();
  HttpOverrides.global = MyHttpOverrides();
  initialize.configureDio();

  runApp(
    const ProviderScope(
      key: Key("init_provider_scope"),
      child: AiApp(),
    ),
  );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class AiApp extends ConsumerStatefulWidget {
  const AiApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AiAppState();
}

class _AiAppState extends ConsumerState<AiApp> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Brightness mode = MediaQuery.of(context).platformBrightness;
    if (mode == Brightness.dark) {
      ref
          .watch(themeProvider.notifier)
          .update((state) => state = AppTheme.darkTheme);
    } else {
      ref
          .watch(themeProvider.notifier)
          .update((state) => state = AppTheme.lightTheme);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);

    return CupertinoApp(
        theme: AppThemes.appThemeData[theme],
        home: const ScreenUtilInit(
          minTextAdapt: true,
          child: SignInLayout(
            key: Key("MainResposibleLayout"),
            // title: "Imaginarium",
          ),
        ),
        initialRoute: SignInLayout.route,
        routes: {
          SignInLayout.route: (context) => const SignInLayout(),
        });
  }
}
