import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:story_creator/core/constants.dart';
import 'package:story_creator/ui/core/password_validation_text.dart';
import 'package:story_creator/ui/layouts/main/main_layout.dart';
import 'package:story_creator/ui/layouts/sendpasswordreset/send_password_reset_layout.dart';
import 'package:story_creator/ui/layouts/updateDisplayName/update_display_name_layout.dart';
import 'package:story_creator/ui/providers/email_verification_provider.dart';
import 'package:story_creator/ui/providers/password_textcontroller_provider.dart';
import 'package:story_creator/ui/providers/auth_vm_provider.dart';
import 'package:story_creator/ui/providers/password_validator_provider.dart';

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
    Future(
      () => ref.read(passwordValidatorProvider.notifier).validatePassword(''),
    );
    final emailController = ref.watch(emailControllerProvider.notifier).state;
    final passwordController = ref.watch(passwordControllerProvider);

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
                            .read(passwordValidatorProvider.notifier)
                            .validatePassword(value);
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
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CupertinoButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, SendPasswordResetLinkLayout.route);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 28.w),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        'Forgot password', style: TextStyle(fontSize: 7.sp),
                        // tr('forgot_my_password'),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0, left: 40.w),
                  child: const PasswordValidationText(),
                ),
              ],
            ),
            Gap(4.h),
            Padding(
              padding: EdgeInsets.all(6.r),
              child: CupertinoButton(
                key: const Key("create_account_button"),
                borderRadius: BorderRadius.all(Radius.circular(36.r)),
                onPressed: () async {
                  final validationState = ref.read(passwordValidatorProvider);
                  final isValidPassword =
                      validationState.errors.isEmpty ? true : false;

                  final isValidEmail =
                      ref.read(emailValidationProvider(emailController.text));
                  if (isValidEmail) {
                    logger.i("valid email");
                  } else {
                    logger.i("invalid email");
                    Fluttertoast.showToast(
                        msg: "Wrong email",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.SNACKBAR,
                        timeInSecForIosWeb: 1,
                        fontSize: 13.sp);
                  }
                  if (isValidPassword) {
                    logger.i("valid password");
                  } else {
                    Fluttertoast.showToast(
                        msg: "Wrong password",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.SNACKBAR,
                        timeInSecForIosWeb: 1,
                        fontSize: 13.sp);

                    logger.i("invalid password");
                  }
                  if (isValidEmail && isValidPassword) {
                    //Navigate to create account:

                    final viewModel = ref.read(authViewModelProvider);
                    viewModel
                        .createUser(
                            emailController.text, passwordController.text)
                        .then((_) {
                      logger.i("user create");
                      // 1 - verify email
                      viewModel.sendEmailVerification().then((value) {
                        logger.d("email sent");
                        // 2 - Choose username
                        Navigator.pushNamed(
                          context,
                          SendPasswordResetLinkLayout.route,
                        );
                      }).catchError(
                        (error) {
                          logger.i("$error");
                          Fluttertoast.showToast(
                              msg: "Wrong credentials",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.SNACKBAR,
                              timeInSecForIosWeb: 1,
                              fontSize: 13.sp);
                        },
                      );
                    }).catchError(
                      (error) {
                        logger.i("$error");
                        Fluttertoast.showToast(
                            msg: "Some error",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.SNACKBAR,
                            timeInSecForIosWeb: 1,
                            fontSize: 13.sp);
                      },
                    );
                  } else {
                    logger.i("invalid crendetial");
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
                    color: CupertinoColors.white,
                    border: Border.all(
                      color: CupertinoColors.black,
                      width: 0.8.w, // Border thickness
                    ),
                    borderRadius: BorderRadius.circular(kButtonRadius.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        spreadRadius: 3.r,
                        blurRadius: 36.r,
                        offset: Offset(0, 8.h),
                      ),
                    ], // Border radius
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
                  var isValidPassword = false;
                  final validationState = ref.read(passwordValidatorProvider);
                  isValidPassword =
                      validationState.errors.isEmpty ? true : false;

                  final isValidEmail =
                      ref.read(emailValidationProvider(emailController.text));

                  if (isValidEmail) {
                    if (kDebugMode) {
                      logger.i("valid email");
                    }
                  } else {
                    if (kDebugMode) {
                      logger.i("invalid email");
                    }
                  }
                  if (isValidPassword) {
                    if (kDebugMode) {
                      logger.i("valid password");
                    }
                  } else {
                    if (kDebugMode) {
                      logger.i(
                          "Un mínimo de ocho caracteres y al menos un número");
                    }
                  }
                  if (isValidEmail && isValidPassword) {
                    final viewModel = ref.read(authViewModelProvider);
                    viewModel
                        .signIn(emailController.text, passwordController.text)
                        .then((user) {
                      if (kDebugMode) {
                        logger.i("logged. Navigate to MainLayout or Update");
                      }
                      viewModel.getDisplayNameCurrentUser().then(
                        (value) {
                           logger.i("AAA $value ");
                          if (value.isNotEmpty) {
                            if (kDebugMode) {
                              logger.i("logged. Navigate to MainLayout ");
                            }
                            Navigator.pushReplacementNamed(
                                context, MainLayout.route);
                          } else {
                            logger.i("logged. Navigate to UpdateDisplayName ");

                            Navigator.pushReplacementNamed(
                                context, UpdateDisplayNameLayout.route);
                          }
                        },
                      );
                    }).catchError(
                      (error) {
                        if (kDebugMode) {
                          logger.i("$error");
                          Fluttertoast.showToast(
                              msg: "Wrong credentials",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.SNACKBAR,
                              timeInSecForIosWeb: 1,
                              fontSize: 13.sp);
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
                    color: CupertinoColors.white,

                    border: Border.all(
                      color: CupertinoColors.black,
                      width: 0.8.w, // Border thickness
                    ),
                    borderRadius: BorderRadius.circular(kButtonRadius.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        spreadRadius: 3.r,
                        blurRadius: 36.r,
                        offset: Offset(0, 8.h),
                      ),
                    ], // Border radius
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
            Gap(16.h),
          ],
        ),
      ),
    );
  }
}
