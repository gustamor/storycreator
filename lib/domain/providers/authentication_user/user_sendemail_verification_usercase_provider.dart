import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/domain/usecases/authentication_user/user_send_email_verification.dart';


final sendEmailVerificationUseCaseProvider = Provider<SendEmailVerificationUseCase>((ref) {
  return SendEmailVerificationUseCase(ref);
});