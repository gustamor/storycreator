import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final suffixIconProvider =
    StateProvider.family<IconData, bool>((ref, obscured) {
  return obscured ? CupertinoIcons.eye_slash : CupertinoIcons.eye;
});
