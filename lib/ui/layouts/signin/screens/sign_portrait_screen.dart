import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:story_creator/core/constants.dart';
import 'package:story_creator/ui/core/password_validation_text.dart';
import 'package:story_creator/ui/layouts/sendpasswordreset/send_password_reset_layout.dart';
import 'package:story_creator/ui/layouts/signin/signin.dart';
import 'package:story_creator/ui/providers/email_verification_provider.dart';
import 'package:story_creator/ui/providers/password_suffix_icon_provider.dart';
import 'package:story_creator/ui/providers/password_textcontroller_provider.dart';
import 'package:story_creator/ui/providers/password_validator_provider.dart';
import 'package:story_creator/ui/providers/password_visibility_provider.dart';

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
      () {
        final password = ref.watch(passwordControllerProvider).text;
        if (password.isEmpty) {
          ref.read(passwordValidatorProvider.notifier).validatePassword('');
        } else {
          ref
              .read(passwordValidatorProvider.notifier)
              .validatePassword(password);
        }
      },
    );
    final passwordVisible = ref.watch(passwordVisibilityProvider);
    final suffixIcon =
        ref.watch(suffixIconProvider(passwordVisible).notifier).state;

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
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              key: const Key("imageBox"),
              child: Image.asset(
                key: const Key("imageAsset"),
                kImageElfaLibro,
                width: double.infinity,
                height: 156.h,
                fit: BoxFit.fill,
              ),
            ),
            Gap(1.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    ref.read(signInProvider).loginWithGoogle(context, ref);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: CupertinoTheme.of(context).primaryColor,
                      border: Border.all(
                        color:
                            CupertinoTheme.of(context).scaffoldBackgroundColor,
                        width: kButtonSideLandscape.w, // Border thickness
                      ),
                      borderRadius: BorderRadius.circular(4.r),
                      boxShadow: [
                        BoxShadow(
                          color: CupertinoTheme.of(context)
                              .primaryColor
                              .withOpacity(0.15),
                          spreadRadius: 1.r,
                          blurRadius: 12.r,
                          offset: Offset(0, 2.h),
                        ),
                      ], // // Border radius
                    ),
                    constraints:  BoxConstraints(
                      maxWidth: 90.w,
                    ),
                    height: 23.h,
                    width: 19.w,
                    child: Center(
                      child: Padding(
                        padding:  EdgeInsets.all(5.r),
                        child: Image.asset(kIconLogoGoogle),
                      ),
                    ),
                  ),
                ),
                Gap(6.w),
                SignInButton(
                  Buttons.appleDark,
                  mini: true,
                  text: "  Continue with Apple",
                  onPressed: () {},
                ),
                Gap(4.h),
                SignInButton(
                  Buttons.microsoft,
                  mini: true,
                  text: "  Continue with Microsoft",
                  onPressed: () =>
                      ref.read(signInProvider).loginWithFacebook(context, ref),
                ),
                Gap(4.h),
                SignInButton(
                  Buttons.gitHub,
                  mini: true,
                  text: "  Continue with Github",
                  onPressed: () {
                    ref.read(signInProvider).loginWithGithub(context, ref);
                  },
                ),
                SignInButton(
                  Buttons.yahoo,
                  mini: true,
                  text: "  Continue with Yahoo!",
                  onPressed: () {
                    ref.read(signInProvider).loginWithYahoo(context, ref);
                  },
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 84.w),
              child: const Divider(),
            ),
            Gap(3.h),
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
                        child: Icon(CupertinoIcons.lock,
                            size: kIconTextFieldSize.sp),
                      ),
                      suffix: GestureDetector(
                        onTap: () {
                          ref
                              .read(passwordVisibilityProvider.notifier)
                              .update((state) => !state);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: kIconTextFieldPadding.w),
                          child: Icon(suffixIcon, size: kIconTextFieldSize.sp),
                        ),
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
                      obscureText: passwordVisible,
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
                    padding: EdgeInsets.only(top: 0, right: 28.w),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        'Forgot password', style: TextStyle(fontSize: 8.sp),
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
                onPressed: () =>
                    ref.read(signInProvider).createUser(context, ref),
                child: Container(
                  width: kButtonWidth.w,
                  height: kButtonHeight.h,
                  padding: EdgeInsets.all(12.0.r),
                  decoration: BoxDecoration(
                    color: CupertinoTheme.of(context).scaffoldBackgroundColor,
                    border: Border.all(
                      color: CupertinoTheme.of(context).scaffoldBackgroundColor,
                      width: 0.8.w, // Border thickness
                    ),
                    borderRadius: BorderRadius.circular(kButtonRadius.r),
                    boxShadow: [
                      BoxShadow(
                        color: CupertinoTheme.of(context)
                            .primaryColor
                            .withOpacity(0.15),
                        spreadRadius: 1.r,
                        blurRadius: 12.r,
                        offset: Offset(0, 2.h),
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
                onPressed: () => ref.read(signInProvider).login(context, ref),
                child: Container(
                  width: kButtonWidth.w,
                  height: kButtonHeight.h,
                  padding: EdgeInsets.all(12.0.r),
                  decoration: BoxDecoration(
                    color: CupertinoTheme.of(context).scaffoldBackgroundColor,

                    border: Border.all(
                      color: CupertinoTheme.of(context).scaffoldBackgroundColor,
                      width: 0.8.w, // Border thickness
                    ),
                    borderRadius: BorderRadius.circular(kButtonRadius.r),
                    boxShadow: [
                      BoxShadow(
                        color: CupertinoTheme.of(context)
                            .primaryColor
                            .withOpacity(0.15),
                        spreadRadius: 1.r,
                        blurRadius: 12.r,
                        offset: Offset(0, 2.h),
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
          ],
        ),
      ),
    );
  }
}
