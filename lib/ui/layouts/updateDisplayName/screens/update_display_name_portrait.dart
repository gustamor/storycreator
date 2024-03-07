import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:story_creator/core/constants.dart';
import 'package:story_creator/ui/providers/displayname_controller_provider.dart';

class UpdateDisplayNamePortraitScreen extends ConsumerWidget {
  UpdateDisplayNamePortraitScreen({super.key});
  final GlobalKey<FormState> _displayNameFormkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayNameController =
        ref.watch(displayNameControllerProvider.notifier).state;

    return CupertinoPageScaffold(
      key: const Key('displayname_scaffold_portrait'),
      navigationBar: CupertinoNavigationBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(CupertinoIcons.back)),
        previousPageTitle: "Authorization",
        middle: const Text(
          'Name Screen',
          key: Key("displayname_title_portrait"),
        ),
      ),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Gap(196.h),
          Text(
            key: const Key('display_name_label_portrait'),
            "¿Cómo quieres que te llamemos?",
            style: TextStyle(fontSize: kButtonFontSize.sp),
          ),
          Gap(16.h),
          Form(
            key: _displayNameFormkey,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 32.w,
              ),
              child: CupertinoTextField(
                key: const Key("display_name_field_portrait"),
                controller: displayNameController,
                onChanged: (value) {},
                placeholder: "Your alias",
                prefix: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: kIconTextFieldPadding.w),
                  child:
                      Icon(CupertinoIcons.person, size: kIconTextFieldSize.sp),
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
                  borderRadius: BorderRadius.circular(kIconTextFieldRadius.w),
                  border: Border.all(
                      width: kIconTextFieldRadiusSide.r,
                      color: CupertinoColors.black),
                ),
              ),
            ),
          ),
          Gap(24.h),
          Padding(
            padding: EdgeInsets.all(6.r),
            child: CupertinoButton(
              key: const Key("display_name_button_portrait"),
              borderRadius: BorderRadius.all(Radius.circular(34.r)),
              onPressed: () async {},
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
        ],
      )),
    );
  }
}
