import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class SignIn {
  Future<void> login(BuildContext context, WidgetRef ref);
  Future<void> createUser(BuildContext context, WidgetRef ref);
}
