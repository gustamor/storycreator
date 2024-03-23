import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/data/repositories/credentials/signin_facebook_credentials_repository.dart';

final facebookCredentialsProvider = FutureProvider<FacebookAuthImpl>((ref) async {
  final facebookSignIn =  FacebookAuthImpl();
  return facebookSignIn;
});


