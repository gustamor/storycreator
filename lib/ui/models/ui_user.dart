
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ui_user.freezed.dart';

@freezed
class UiUser with _$UiUser {
  const factory UiUser({
    required String id,
    required String email,
    required String userName,
    String? profilePictureUrl,
    @Default(false) bool isLogged,
    String? name,
    String? surname,
  }) = _UiUser;

  
}