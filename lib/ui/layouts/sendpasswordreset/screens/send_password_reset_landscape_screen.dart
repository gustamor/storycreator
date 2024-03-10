import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:story_creator/core/constants.dart';
import 'package:story_creator/ui/layouts/signin/signin_layout.dart';

class SendPasswordResetLinkLandscapeScreen extends ConsumerStatefulWidget {
  const SendPasswordResetLinkLandscapeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SendPasswordResetLinkLandscapeScreenState();
}

class _SendPasswordResetLinkLandscapeScreenState
    extends ConsumerState<SendPasswordResetLinkLandscapeScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      key: const Key('displayname_scaffold_landscape'),
      navigationBar: CupertinoNavigationBar(
        leading: GestureDetector(
            key: const Key("resetpassword_gesture_landscape"),
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(CupertinoIcons.back)),
        previousPageTitle: SignInLayout.route,
        middle: const Text(
          'Reset Password Screen',
          key: Key("reset_password_title_landscape"),
        ),
      ),
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(196.h),
                Text(
                  key: const Key('reset_password_text_landscape'),
                  "Te hemos envíado un email para cambiar el password",
                  style: TextStyle(fontSize: kButtonFontSizeLandscape.sp),
                ),
                Gap(32.h),
                Padding(
                  padding: EdgeInsets.all(6.r),
                  child: CupertinoButton(
                    key: const Key("reset_password_confirmation_landscape"),
                    borderRadius: BorderRadius.all(Radius.circular(34.r)),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: kButtonWidthLandscape.w,
                      height: kButtonHeightLandscape.h,
                      padding: EdgeInsets.all(12.0.r),
                      decoration: BoxDecoration(
                        color: CupertinoColors.white,
                        border: Border.all(
                          color: CupertinoColors.black,
                          width: 0.8.w, // Border thickness
                        ),
                        borderRadius:
                            BorderRadius.circular(kButtonRadiusLandscape.r),
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
                          "Vale",
                          style:
                              TextStyle(fontSize: kButtonFontSizeLandscape.sp),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
