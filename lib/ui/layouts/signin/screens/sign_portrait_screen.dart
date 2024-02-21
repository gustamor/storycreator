import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:story_creator/core/constants.dart';
import 'package:story_creator/ui/providers/email_verification_provider.dart';
import 'package:story_creator/ui/providers/password_provider.dart';
import 'package:story_creator/ui/providers/auth_vm_provider.dart';

class SignPortraitScreen extends ConsumerStatefulWidget {
  const SignPortraitScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SignPortraitScreenState();
}

class _SignPortraitScreenState extends ConsumerState<SignPortraitScreen> {
  final title = "Authorization Screen";
  final GlobalKey<FormState> _authFormkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final emailController = ref.watch(emailControllerProvider.notifier).state;
    final passwordController =
        ref.watch(passwordControllerProvider.notifier).state;

    return CupertinoPageScaffold(
      key: const Key("scaffold_sign_portrait"),
      navigationBar: CupertinoNavigationBar(
        leading: const Icon(CupertinoIcons.back),
        previousPageTitle: "Exit",
        middle: Text(
          title,
          key: const Key("sign_nav_title"),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              key: const Key("imageBox"),
              child: Image.asset(
                key: const Key("imageAsset"),
                kImageElfaLibro,
                width: double.infinity,
                height: 272.h,
                fit: BoxFit.fill,
              ),
            ),
            Gap(16.h),
            Form(
              key: _authFormkey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 32.w,
                    ),
                    child: CupertinoTextField(
                      key: const Key("emailField"),
                      controller: emailController,

                      onChanged: (value) {
                        ref
                            .read(emailProvider.notifier)
                            .update((state) => state = value);
                        ref.read(emailErrorProvider.notifier).state = null;
                      },
                      placeholder: "Email",
                      prefix: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: kIconTextFieldPadding.w),
                        child: Icon(CupertinoIcons.mail,
                            size: kIconTextFieldSize.sp),
                      ),
                      prefixMode: OverlayVisibilityMode.always,
                      autocorrect: true,
                      keyboardType: TextInputType.emailAddress,
                      scrollPhysics:
                          const ScrollPhysics(), // Physics for the scrollable content.
                      maxLines: 1,
                      keyboardAppearance: Brightness.dark,
                      padding: EdgeInsets.symmetric(
                          vertical: kTextFieldVerticalPadding.h,
                          horizontal: kTextFieldHorizontalPadding.w),
                      style: TextStyle(fontSize: kIconTextFieldFontSize.sp),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(kIconTextFieldRadius.w),
                        border: Border.all(
                            width: kIconTextFieldRadiusSide.r,
                            color: CupertinoColors.black),
                      ),
                    ),
                  ),
                  Gap(16.h),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 32.w,
                    ),
                    child: CupertinoTextField(
                      key: const Key("passwordField"),
                      controller: passwordController,
                      onChanged: (value) {
                        ref
                            .read(passwordProvider.notifier)
                            .update((state) => state = value);
                        ref.read(passwordErrorProvider.notifier).state = null;
                      },
                      placeholder: "Password",
                      prefix: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: kIconTextFieldPadding.w),
                        child: Icon(CupertinoIcons.alarm,
                            size: kIconTextFieldSize.sp),
                      ),
                      prefixMode: OverlayVisibilityMode.always,
                      autocorrect: true,
                      keyboardType: TextInputType.emailAddress,
                      scrollPhysics:
                          const ScrollPhysics(), // Physics for the scrollable content.
                      maxLines: 1,
                      obscuringCharacter: "•", //
                      padding: EdgeInsets.symmetric(
                          vertical: kTextFieldVerticalPadding.h,
                          horizontal: kTextFieldHorizontalPadding.w),
                      style: TextStyle(fontSize: kIconTextFieldFontSize.sp),
                      obscureText: true,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(kIconTextFieldRadius.r),
                        border: Border.all(
                            width: kIconTextFieldRadiusSide.r,
                            color: CupertinoColors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Gap(1.h),
            CupertinoButton(
              onPressed: () {
                //TODO: Navigate to Password change screen
              },
              child: Padding(
                padding: EdgeInsets.only(right: 36.w),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'Forgot password', style: TextStyle(fontSize: 10.sp),
                    // tr('forgot_my_password'),
                  ),
                ),
              ),
            ),
            Gap(4.h),
            Padding(
              padding: EdgeInsets.all(6.r),
              child: CupertinoButton(
                key: const Key("create_account_button"),
                borderRadius: BorderRadius.all(Radius.circular(16.r)),
                onPressed: () async {
                  final isValidPassword = ref.read(passwordValidationProvider);
                  final isValidEmail =
                      ref.read(emailValidationProvider(emailController.text));
                  if (isValidEmail) {
                    if (kDebugMode) {
                      print("AAA valid email");
                    }
                  } else {
                    if (kDebugMode) {
                      print("AAA invalid email");
                    }
                  }
                  if (isValidPassword) {
                    if (kDebugMode) {
                      print("AAA valid password");
                    }
                  } else {
                    if (kDebugMode) {
                      print("AAA invalid password");
                    }
                  }
                  if (isValidEmail && isValidPassword) {
                    //Navigate to create account:
                    // 1 - verfify password
                    // 2 - Choose username
                  }

                  final viewModel = ref.read(authViewModelProvider);
                  viewModel
                      .createUser(emailController.text, passwordController.text)
                      .then((_) {
                    if (kDebugMode) {
                      print("AAA user create");
                      viewModel.sendEmailVerification().then((value) {
                        if (kDebugMode) {
                          print("AAA email sent");
                        }
                      }).catchError(
                        (error) {
                          if (kDebugMode) {
                            print("AAA $error");
                          }
                        },
                      );
                    }
                  }).catchError(
                    (error) {
                      if (kDebugMode) {
                        print("AAA $error");
                      }
                    },
                  );
                },
                child: Container(
                  width: kButtonWidth.w,
                  height: kButtonHeight.h,
                  padding: EdgeInsets.all(12.0.r),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: CupertinoColors.black,
                      width: 1.0.w, // Border thickness
                    ),
                    borderRadius:
                        BorderRadius.circular(kButtonRadius.r), // Border radius
                  ),
                  child: Center(
                    child: Text(
                      "Create Account",
                      style: TextStyle(fontSize: kButtonFontSize.sp),
                    ),
                  ),
                ),
              ),
            ),
            Text("  - - - - - OR - - - - - ",
                style: TextStyle(fontSize: kButtonFontSize.sp)),
            Padding(
              padding: EdgeInsets.all(6.r),
              child: CupertinoButton(
                key: const Key("log_in_button"),
                borderRadius: BorderRadius.all(Radius.circular(34.r)),
                onPressed: () async {
                  final isValidPassword = ref.read(passwordValidationProvider);
                  final isValidEmail =
                      ref.read(emailValidationProvider(emailController.text));

                  if (isValidEmail) {
                    if (kDebugMode) {
                      print("AAA valid email");
                    }
                  } else {
                    if (kDebugMode) {
                      print("AAA invalid email");
                    }
                  }
                  if (isValidPassword) {
                    if (kDebugMode) {
                      print("AAA valid password");
                    }
                  } else {
                    if (kDebugMode) {
                      print(
                          "AAA  Un mínimo de ocho caracteres y al menos un número");
                    }
                  }
                  if (isValidEmail && isValidPassword) {
                    final viewModel = ref.read(authViewModelProvider);
                    viewModel
                        .signIn(emailController.text, passwordController.text)
                        .then((user) {
                      if (kDebugMode) {
                        print("AAA logged. Navigate to...");
                      }
                      // Navegar a la siguiente pantalla o mostrar éxito
                    }).catchError(
                      (error) {
                        if (kDebugMode) {
                          print("AAA $error");
                        }
                        // Mostrar mensaje de error
                      },
                    );
                  } else {
                    Fluttertoast.showToast(
                        msg: "Wrong credentials",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.SNACKBAR,
                        timeInSecForIosWeb: 1,
                        fontSize: 13.sp);
                  }
                },
                child: Container(
                  width: kButtonWidth.w,
                  height: kButtonHeight.h,
                  padding: EdgeInsets.all(12.0.r),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: CupertinoColors.black,
                      // Border color
                      width: 1.0.w, // Border thickness
                    ),
                    borderRadius:
                        BorderRadius.circular(kButtonRadius.r), // Border radius
                  ),
                  child: Center(
                    child: Text(
                      "Log In",
                      style: TextStyle(fontSize: kButtonFontSize.sp),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
