import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:story_creator/core/constants.dart';
import 'package:story_creator/ui/core/error_validate_password_enum.dart';
import 'package:story_creator/ui/providers/password_validator_provider.dart';

class PasswordValidationText extends ConsumerStatefulWidget {
  const PasswordValidationText({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PasswordValidationTextState();
}

class _PasswordValidationTextState
    extends ConsumerState<PasswordValidationText> {
  @override
  Widget build(BuildContext context) {
    final validationState = ref.watch(passwordValidatorProvider);
    final orientation = MediaQuery.of(context).orientation;

    if (orientation == Orientation.portrait) {
      return Row(
        children: [
          Text(
            "At least ",
            style: TextStyle(
              fontSize: kPasswordValidationTextSize.sp,
              color: const Color(0xff0000ff),
            ),
          ),
          Text(
            "8 characters, ",
            style: TextStyle(
              fontSize: kPasswordValidationTextSize.sp,
              color:
              validationState.errors.contains(ErrorValidatePassword.lessLength)
                  ? const Color(0xffff0000)
                  :const Color(0xff0000ff),
            ),
          ),
          Text(
            "1 letter, ",
            style: TextStyle(
              fontSize: kPasswordValidationTextSize.sp,
              color:
              validationState.errors.contains(ErrorValidatePassword.noLetter)
                  ? const Color(0xffff0000)
                  :const Color(0xff0000ff),
            ),
          ),
          Text(
            "1 upper case, ",
            style: TextStyle(
              fontSize: kPasswordValidationTextSize.sp,
              color: validationState.errors
                  .contains(ErrorValidatePassword.noUpperCase)
                  ? const Color(0xffff0000)
                  : const Color(0xff0000ff),
            ),
          ),

          Text(
            "1 number",
            style: TextStyle(
              fontSize: kPasswordValidationTextSize.sp,
              color:
              validationState.errors.contains(ErrorValidatePassword.noNumber)
                  ? const Color(0xffff0000)
                  : const Color(0xff0000ff),
            ),
          ),
        ],
      );
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "At least ",
            style: TextStyle(
              fontSize: kPasswordValidationTextSizeLandscape.sp,
              color: const Color(0xff0000ff),
            ),
          ),

            Text(
              "8 characters, ",
              style: TextStyle(
                fontSize: kPasswordValidationTextSizeLandscape.sp,
                color:
                validationState.errors.contains(ErrorValidatePassword.lessLength)
                    ? const Color(0xffff0000)
                    :const Color(0xff0000ff),
              ),
            ),
            Text(
              "1 letter, ",
              style: TextStyle(
                fontSize: kPasswordValidationTextSizeLandscape.sp,
                color:
                validationState.errors.contains(ErrorValidatePassword.noLetter)
                    ? const Color(0xffff0000)
                    :const Color(0xff0000ff),
              ),
            ),
            Text(
              "1 upper case, ",
              style: TextStyle(
                fontSize: kPasswordValidationTextSizeLandscape.sp,
                color: validationState.errors
                    .contains(ErrorValidatePassword.noUpperCase)
                    ? const Color(0xffff0000)
                    : const Color(0xff0000ff),
              ),
            ),

            Text(
              "1 number",
              style: TextStyle(
                fontSize: kPasswordValidationTextSizeLandscape.sp,
                color:
                validationState.errors.contains(ErrorValidatePassword.noNumber)
                    ? const Color(0xffff0000)
                    : const Color(0xff0000ff),
              ),
            ),


        ],
      );

    }

  }
}