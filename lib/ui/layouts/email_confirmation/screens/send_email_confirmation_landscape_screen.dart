import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:story_creator/core/constants.dart';
import 'package:story_creator/ui/layouts/signin/signin_layout.dart';

class SendEmailConfirmationLandscapeScreen extends ConsumerStatefulWidget {
  const SendEmailConfirmationLandscapeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SendEmailConfirmationLandscapeScreenState();
}

class _SendEmailConfirmationLandscapeScreenState
    extends ConsumerState<SendEmailConfirmationLandscapeScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      key: const Key('email_link_scaffold_landscape'),
      navigationBar: CupertinoNavigationBar(
        leading: GestureDetector(
            key: const Key("email_link_gesture_landscape"),
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(CupertinoIcons.back)),
        previousPageTitle: SignInLayout.route,
        middle: const Text(
          'Email Confirmation Send',
          key: Key("email_link_title_landscape"),
        ),
      ),
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Gap(196.h),
                  Text(
                    key: const Key('email_link_text_landscape'),
                    "Te hemos envíado un email para confirmar tu email ",
                    style: TextStyle(fontSize: kButtonFontSizeLandscape.sp),
                  ),
                  Gap(32.h),
                  Padding(
                    padding: EdgeInsets.all(6.r),
                    child: CupertinoButton(
                      key: const Key("email_link_confirmation_landscape"),
                      borderRadius: BorderRadius.all(Radius.circular(34.r)),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: kButtonWidthLandscape.w,
                        height: kButtonHeightLandscape.h,
                        padding: EdgeInsets.all(12.0.r),
                        decoration: BoxDecoration(
                          color: CupertinoTheme.of(context)
                              .scaffoldBackgroundColor,
                          border: Border.all(
                            color: CupertinoTheme.of(context)
                                .scaffoldBackgroundColor,
                            width: 0.8.w, // Border thickness
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
                            "Vale",
                            style: TextStyle(
                                fontSize: kButtonFontSizeLandscape.sp),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
