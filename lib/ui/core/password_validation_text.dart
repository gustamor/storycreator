import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

    return Row(
      children: [
        Text(
          "At least ",
          style: TextStyle(
            fontSize: 10.sp,
            color: const Color(0xff0000ff),
          ),
        ),
         Text(
          "8 characters, ",
          style: TextStyle(
            fontSize: 10.sp,
            color:
                validationState.errors.contains(ErrorValidatePassword.lessLengt)
                    ? const Color(0xffff0000)
                    :const Color(0xff0000ff),
          ),
        ),
         Text(
          "1 letter, ",
          style: TextStyle(
            fontSize: 10.sp,
            color:
                validationState.errors.contains(ErrorValidatePassword.noLetter)
                    ? const Color(0xffff0000)
                    :const Color(0xff0000ff),
          ),
        ),
        Text(
          "1 upper case, ",
          style: TextStyle(
            fontSize: 10.sp,
            color: validationState.errors
                    .contains(ErrorValidatePassword.noUpperCase)
                ? const Color(0xffff0000)
                : const Color(0xff0000ff),
          ),
        ),
       
        Text(
          "1 number",
          style: TextStyle(
            fontSize: 10.sp,
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
