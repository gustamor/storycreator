import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_user.freezed.dart';

@freezed
class DataUser with _$DataUser {
  const factory DataUser({
    required String id,
    required String email,
    required String userName,
    String? profilePictureUrl,
    @Default(false) bool isLogged,
    String? name,
    String? surname,
  }) = _DataUser;
}
