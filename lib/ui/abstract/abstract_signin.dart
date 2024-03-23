import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class SignIn {
  Future<void> createUser(BuildContext context, WidgetRef ref);
  Future<void> login(BuildContext context, WidgetRef ref);
  Future<void> loginWithGoogle(BuildContext context, WidgetRef ref);
  Future<void> loginWithFacebook(BuildContext context, WidgetRef ref);
  Future<void> loginWithGithub(BuildContext context, WidgetRef ref);
}
