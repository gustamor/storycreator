import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/data/repositories/google_signin_credentials_repository.dart';

final googleCredentialsProvider = FutureProvider<GoogleAuthImpl>((ref) async {
  final googleSign =  GoogleAuthImpl();
  return googleSign;
});
