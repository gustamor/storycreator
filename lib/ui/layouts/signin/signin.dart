import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:story_creator/core/constants.dart';
import 'package:story_creator/ui/abstract/abstract_signin.dart';
import 'package:story_creator/ui/layouts/email_confirmation/send_email_confirmation_layout.dart';
import 'package:story_creator/ui/layouts/main/main_layout.dart';
import 'package:story_creator/ui/layouts/updateDisplayName/update_display_name_layout.dart';
import 'package:story_creator/ui/providers/auth_vm_provider.dart';
import 'package:story_creator/ui/providers/email_verification_provider.dart';
import 'package:story_creator/ui/providers/password_textcontroller_provider.dart';
import 'package:story_creator/ui/providers/password_validator_provider.dart';

final signInProvider = Provider<SignInImpl>((ref) {
  final signin = SignInImpl();
  return signin;
});

class SignInImpl extends SignIn {
  @override
  Future<void> createUser(BuildContext context, WidgetRef ref) async {
    final emailController = ref.watch(emailControllerProvider.notifier).state;
    final passwordController = ref.watch(passwordControllerProvider);

    final validationState = ref.read(passwordValidatorProvider);
    final isValidPassword = validationState.errors.isEmpty ? true : false;

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
          .createUser(emailController.text, passwordController.text)
          .then((_) {
        logger.i("user create");
        // 1 - verify email
        viewModel.sendEmailVerification().then((value) {
          logger.d("email sent");
          // 2 - Choose username
          Navigator.pushNamed(
            context,
            SendEmailConfirmationLayout.route,
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
  }

  @override
  Future<void> login(BuildContext context, WidgetRef ref) async {
    final emailController = ref.watch(emailControllerProvider.notifier).state;
    final passwordController = ref.watch(passwordControllerProvider);

    final validationState = ref.read(passwordValidatorProvider);
    final isValidPassword = validationState.errors.isEmpty ? true : false;

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
        logger.i("Un mínimo de ocho caracteres y al menos un número");
      }
    }

    if (isValidEmail && isValidPassword) {
      final viewModel = ref.read(authViewModelProvider);

      viewModel
          .signInWithEmailAndPassword(
              emailController.text, passwordController.text)
          .then((user) {
        viewModel.checkIfAccountIsVerified().then(
          (verified) {
            if (verified == true) {
              viewModel.getDisplayNameCurrentUser().then(
                (value) {
                  logger.i("AAA $value ");
                  if (value.isNotEmpty) {
                    if (kDebugMode) {
                      logger.i("logged. Navigate to MainLayout ");
                    }
                    Navigator.pushReplacementNamed(context, MainLayout.route);
                  } else {
                    logger.i("logged. Navigate to UpdateDisplayName ");

                    Navigator.pushReplacementNamed(
                        context, UpdateDisplayNameLayout.route);
                  }
                },
              ).catchError(
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
                },
              );
            } else {
              Navigator.pushNamed(context, SendEmailConfirmationLayout.route);
            }
          },
        );
      }).catchError(
        (error) {
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
  }

  @override
  Future<void> loginWithGoogle(BuildContext context, WidgetRef ref) async {
    final viewModel = ref.read(authViewModelProvider);

    viewModel.signInWithGoogle().then((user) {
      viewModel.getDisplayNameCurrentUser().then(
        (value) {
          logger.d("AAA $value ");
          if (value.isNotEmpty) {
            if (kDebugMode) {
              logger.d("logged. Navigate to MainLayout ");
            }
            Navigator.pushReplacementNamed(context, MainLayout.route);
          } else {
            logger.d("logged. Navigate to UpdateDisplayName ");

            Navigator.pushReplacementNamed(
                context, UpdateDisplayNameLayout.route);
          }
        },
      ).catchError(
        (error) {
          if (kDebugMode) {
            logger.d("$error");
            Fluttertoast.showToast(
                msg: "Wrong credentials",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.SNACKBAR,
                timeInSecForIosWeb: 1,
                fontSize: 13.sp);
          }
        },
      );
    });
  }

  @override
  Future<void> loginWithGithub(BuildContext context, WidgetRef ref) async {
    final viewModel = ref.read(authViewModelProvider);

    viewModel.signInWithGithub().then((user) {
      viewModel.getDisplayNameCurrentUser().then(
        (value) {
          logger.d("AAA $value ");
          if (value.isNotEmpty) {
            if (kDebugMode) {
              logger.d("logged. Navigate to MainLayout ");
            }
            Navigator.pushReplacementNamed(context, MainLayout.route);
          } else {
            logger.d("logged. Navigate to UpdateDisplayName ");

            Navigator.pushReplacementNamed(
                context, UpdateDisplayNameLayout.route);
          }
        },
      ).catchError(
        (error) {
          if (kDebugMode) {
            logger.d("$error");
            Fluttertoast.showToast(
                msg: "Wrong credentials",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.SNACKBAR,
                timeInSecForIosWeb: 1,
                fontSize: 13.sp);
          }
        },
      );
    });
  }
}
