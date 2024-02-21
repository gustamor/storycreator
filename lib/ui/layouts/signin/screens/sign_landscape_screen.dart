import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:story_creator/core/constants.dart';
import 'package:story_creator/ui/providers/email_verification_provider.dart';
import 'package:story_creator/ui/providers/password_provider.dart';
import 'package:story_creator/ui/providers/auth_vm_provider.dart';

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
        final emailController = ref.watch(emailControllerProvider.notifier).state;
        final passwordController = ref.watch(passwordControllerProvider.notifier).state;

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                        ref.read(emailProvider.notifier).update((state) => state = value);
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
                        // Actualiza el proveedor del email
                        ref.read(passwordProvider.notifier).update((state) => state = value);
                        // Opcional: Limpiar el error al editar
                        ref.read(passwordErrorProvider.notifier).state = null;
                      },
                          prefix: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: kIconTextFieldPaddingLandscape.w),
                            child: Icon(CupertinoIcons.alarm,
                                size: kIconTextFieldSizeLandscape.sp),
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
                          obscureText: true,
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
                 CupertinoButton(
              onPressed: () {
                //TODO: Navigate to Password change screen
              },
              child: Padding(
                padding: EdgeInsets.only(right: 14.w),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'Forgot password', style: TextStyle(fontSize: 6.sp),
                    // tr('forgot_my_password'),
                  ),
                ),
              ),
            ),
                Padding(
                  padding: EdgeInsets.all(6.r),
                  child: CupertinoButton(
                    key: const Key("create_account_buttonL"),
                    borderRadius: BorderRadius.all(Radius.circular(16.r)),
                    onPressed: () async {},
                    child: Container(
                      width: kButtonWidthLandscape.w,
                      height: kButtonHeightLandscape.h,
                      padding: EdgeInsets.all(12.0.r),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: CupertinoColors.black,
                          width: kButtonSideLandscape.w, // Border thickness
                        ),
                        borderRadius: BorderRadius.circular(
                            kButtonRadiusLandscape.r), // Border radius
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
                    onPressed: () async {
                      final vm = ref.read(authViewModelProvider);
                      vm.signIn(emailController.text, emailController.text);
                    },
                    child: Container(
                      width: kButtonWidthLandscape.w,
                      height: kButtonHeightLandscape.h,
                      padding: EdgeInsets.all(12.0.r),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: CupertinoColors.black,
                          // Border color
                          width: kButtonSideLandscape.w, // B/ Border thickness
                        ),
                        borderRadius: BorderRadius.circular(
                            kButtonRadiusLandscape.r), // Border radius
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
