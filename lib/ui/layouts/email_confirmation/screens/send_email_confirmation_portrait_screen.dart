import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:story_creator/core/constants.dart';
import 'package:story_creator/ui/layouts/signin/signin_layout.dart';

class SendEmailConfirmationPortraitScreen extends ConsumerStatefulWidget {
  const SendEmailConfirmationPortraitScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SendEmailConfirmationPortraitScreenState();
}

class _SendEmailConfirmationPortraitScreenState
    extends ConsumerState<SendEmailConfirmationPortraitScreen> {

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      key: const Key('email_link_scaffold_portrait'),
      navigationBar: CupertinoNavigationBar(
        leading: GestureDetector(
            key: const Key("email_link_gesture_portrait"),
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(CupertinoIcons.back)),
        previousPageTitle: SignInLayout.route,
        middle: const Text(
          'Email Confirmation Send',
          key: Key("email_link_title_portrait"),
        ),
      ),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Gap(196.h),
          Text(
            key: const Key('email_link_label_portrait'),
            "Te hemos envíado un email para confirmar tu cuenta",
            style: TextStyle(fontSize: kIconTextFieldFontSize.sp),
            textAlign: TextAlign.center,
          ),
          Gap(16.h),
          Padding(
            padding: EdgeInsets.all(6.r),
            child: CupertinoButton(
              key: const Key("email_link_button_portrait"),
              borderRadius: BorderRadius.all(Radius.circular(34.r)),
              onPressed: () async {
                Navigator.pop(context);
              },
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
                    "Vale",
                    style: TextStyle(fontSize: kButtonFontSize.sp),
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
