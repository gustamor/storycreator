import 'package:flutter/cupertino.dart';
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

class SignLandscapeScreen extends ConsumerStatefulWidget {
  const SignLandscapeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SignLandscapeScreenState();
}

class _SignLandscapeScreenState extends ConsumerState<SignLandscapeScreen> {
  final title = "Authorization Screen Portrait";
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
      key: const Key("scaffold_sign_landscape"),
      navigationBar: CupertinoNavigationBar(
        leading: const Icon(CupertinoIcons.back),
        previousPageTitle: "Exit",
        middle: Text(
          title,
          key: const Key("sign_nav_titleL"),
        ),
      ),
      child: Row(children: [
        Expanded(
          flex: 5,
          child: SizedBox(
            key: const Key("imageBoxL"),
            child: Image.asset(
              key: const Key("imageAssetL"),
              kImageElfaLibroLand,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Gap(1.h),
                Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: CupertinoTheme.of(context).primaryColor,
                        border: Border.all(
                          color: CupertinoTheme.of(context)
                              .scaffoldBackgroundColor,
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
                      constraints: const BoxConstraints(
                        maxWidth: 220,
                      ),
                      height: 36.h,
                      width: 12.w,
                      child: Padding(
                        padding: EdgeInsets.all(8.5.r),
                        child: Image.asset(kIconLogoGoogle),
                      ),
                    ),
                    Gap(3.w),
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
                      onPressed: () => ref
                          .read(signInProvider)
                          .loginWithFacebook(context, ref),
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
                Gap(3.h),
                Form(
                  key: _authFormkey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                        ),
                        child: CupertinoTextField(
                          key: const Key("emailFieldL"),
                          placeholder: "Email",

                          onChanged: (value) {
                            ref
                                .read(emailProvider.notifier)
                                .update((state) => state = value);
                            ref.read(emailErrorProvider.notifier).state = null;
                          },
                          controller: emailController,
                          prefix: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: kIconTextFieldPaddingLandscape.w),
                            child: Icon(CupertinoIcons.mail,
                                size: kIconTextFieldSizeLandscape.sp),
                          ),
                          prefixMode: OverlayVisibilityMode.always,
                          autocorrect: true,
                          keyboardType: TextInputType.emailAddress,
                          scrollPhysics:
                              const ScrollPhysics(), // Physics for the scrollable content.
                          maxLines: 1,
                          keyboardAppearance: Brightness.dark,
                          padding: EdgeInsets.symmetric(
                              vertical: kTextFieldVerticalPaddingLandscape.h,
                              horizontal:
                                  kTextFieldHorizontalPaddingLandscape.w),
                          style: TextStyle(
                              fontSize: kIconTextFieldFontSizeLandscape.sp),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                kIconTextFieldRadiusLandscape.w),
                            border: Border.all(
                                width: kIconTextFieldRadiusSideLandscape.r,
                                color: CupertinoColors.black),
                          ),
                        ),
                      ),
                      Gap(24.h),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                        ),
                        child: CupertinoTextField(
                          key: const Key("passwordFieldL"),
                          controller: passwordController,
                          placeholder: "Password",
                          onChanged: (value) {
                            ref
                                .read(passwordValidatorProvider.notifier)
                                .validatePassword(value);
                          },
                          prefix: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: kIconTextFieldPaddingLandscape.w),
                            child: Icon(CupertinoIcons.alarm,
                                size: kIconTextFieldSizeLandscape.sp),
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
                          child: Icon(suffixIcon, size: kIconTextFieldSizeLandscape.sp),
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
                              vertical: kTextFieldVerticalPaddingLandscape.h,
                              horizontal:
                                  kTextFieldHorizontalPaddingLandscape.w),
                          style: TextStyle(
                              fontSize: kIconTextFieldFontSizeLandscape.sp),
                          obscureText: passwordVisible,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                kIconTextFieldRadiusLandscape.r),
                            border: Border.all(
                                width: kIconTextFieldRadiusSideLandscape.r,
                                color: CupertinoColors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(2.h),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CupertinoButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, SendPasswordResetLinkLayout.route);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 16.w),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            'Forgot password',
                            style: TextStyle(
                                fontSize: kPasswordTextSizeLandscape.sp),
                            // tr('forgot_my_password'),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 0, left: 16.w),
                      child: const PasswordValidationText(),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(6.r),
                  child: CupertinoButton(
                    key: const Key("create_account_buttonL"),
                    borderRadius: BorderRadius.all(Radius.circular(16.r)),
                    onPressed: () =>
                        ref.read(signInProvider).createUser(context, ref),
                    child: Container(
                      width: kButtonWidthLandscape.w,
                      height: kButtonHeightLandscape.h,
                      padding: EdgeInsets.all(12.0.r),
                      decoration: BoxDecoration(
                        color:
                            CupertinoTheme.of(context).scaffoldBackgroundColor,
                        border: Border.all(
                          color: CupertinoTheme.of(context)
                              .scaffoldBackgroundColor,
                          width: kButtonSideLandscape.w, // Border thickness
                        ),
                        borderRadius:
                            BorderRadius.circular(kButtonRadiusLandscape.r),
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
                      child: Center(
                        child: Text(
                          "Create Account",
                          style:
                              TextStyle(fontSize: kButtonFontSizeLandscape.sp),
                        ),
                      ),
                    ),
                  ),
                ),
                Text("  - - - - - OR - - - - - ",
                    style: TextStyle(fontSize: kButtonFontSizeLandscape.sp)),
                Padding(
                  padding: EdgeInsets.all(6.r),
                  child: CupertinoButton(
                    key: const Key("log_in_buttonL"),
                    borderRadius: BorderRadius.all(Radius.circular(34.r)),
                    onPressed: () =>
                        ref.read(signInProvider).login(context, ref),
                    child: Container(
                      width: kButtonWidthLandscape.w,
                      height: kButtonHeightLandscape.h,
                      padding: EdgeInsets.all(12.0.r),
                      decoration: BoxDecoration(
                        color:
                            CupertinoTheme.of(context).scaffoldBackgroundColor,
                        border: Border.all(
                          color: CupertinoTheme.of(context)
                              .scaffoldBackgroundColor,

                          // Border color
                          width: kButtonSideLandscape.w, // B/ Border thickness
                        ),
                        borderRadius:
                            BorderRadius.circular(kButtonRadiusLandscape.r),
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
                          style:
                              TextStyle(fontSize: kButtonFontSizeLandscape.sp),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
