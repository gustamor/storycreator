import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final displayNameControllerProvider = StateProvider<TextEditingController>(
  (ref) => TextEditingController(),
);
final displayNameErrorProvider = StateProvider<String?>((ref) => null);
