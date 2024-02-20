// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ui_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UiUser {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String? get profilePictureUrl => throw _privateConstructorUsedError;
  bool get isLogged => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get surname => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UiUserCopyWith<UiUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UiUserCopyWith<$Res> {
  factory $UiUserCopyWith(UiUser value, $Res Function(UiUser) then) =
      _$UiUserCopyWithImpl<$Res, UiUser>;
  @useResult
  $Res call(
      {String id,
      String email,
      String userName,
      String? profilePictureUrl,
      bool isLogged,
      String? name,
      String? surname});
}

/// @nodoc
class _$UiUserCopyWithImpl<$Res, $Val extends UiUser>
    implements $UiUserCopyWith<$Res> {
  _$UiUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? userName = null,
    Object? profilePictureUrl = freezed,
    Object? isLogged = null,
    Object? name = freezed,
    Object? surname = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      profilePictureUrl: freezed == profilePictureUrl
          ? _value.profilePictureUrl
          : profilePictureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isLogged: null == isLogged
          ? _value.isLogged
          : isLogged // ignore: cast_nullable_to_non_nullable
              as bool,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      surname: freezed == surname
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UiUserImplCopyWith<$Res> implements $UiUserCopyWith<$Res> {
  factory _$$UiUserImplCopyWith(
          _$UiUserImpl value, $Res Function(_$UiUserImpl) then) =
      __$$UiUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String email,
      String userName,
      String? profilePictureUrl,
      bool isLogged,
      String? name,
      String? surname});
}

/// @nodoc
class __$$UiUserImplCopyWithImpl<$Res>
    extends _$UiUserCopyWithImpl<$Res, _$UiUserImpl>
    implements _$$UiUserImplCopyWith<$Res> {
  __$$UiUserImplCopyWithImpl(
      _$UiUserImpl _value, $Res Function(_$UiUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? userName = null,
    Object? profilePictureUrl = freezed,
    Object? isLogged = null,
    Object? name = freezed,
    Object? surname = freezed,
  }) {
    return _then(_$UiUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      profilePictureUrl: freezed == profilePictureUrl
          ? _value.profilePictureUrl
          : profilePictureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isLogged: null == isLogged
          ? _value.isLogged
          : isLogged // ignore: cast_nullable_to_non_nullable
              as bool,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      surname: freezed == surname
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UiUserImpl implements _UiUser {
  const _$UiUserImpl(
      {required this.id,
      required this.email,
      required this.userName,
      this.profilePictureUrl,
      this.isLogged = false,
      this.name,
      this.surname});

  @override
  final String id;
  @override
  final String email;
  @override
  final String userName;
  @override
  final String? profilePictureUrl;
  @override
  @JsonKey()
  final bool isLogged;
  @override
  final String? name;
  @override
  final String? surname;

  @override
  String toString() {
    return 'UiUser(id: $id, email: $email, userName: $userName, profilePictureUrl: $profilePictureUrl, isLogged: $isLogged, name: $name, surname: $surname)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UiUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.profilePictureUrl, profilePictureUrl) ||
                other.profilePictureUrl == profilePictureUrl) &&
            (identical(other.isLogged, isLogged) ||
                other.isLogged == isLogged) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.surname, surname) || other.surname == surname));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, email, userName,
      profilePictureUrl, isLogged, name, surname);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UiUserImplCopyWith<_$UiUserImpl> get copyWith =>
      __$$UiUserImplCopyWithImpl<_$UiUserImpl>(this, _$identity);
}

abstract class _UiUser implements UiUser {
  const factory _UiUser(
      {required final String id,
      required final String email,
      required final String userName,
      final String? profilePictureUrl,
      final bool isLogged,
      final String? name,
      final String? surname}) = _$UiUserImpl;

  @override
  String get id;
  @override
  String get email;
  @override
  String get userName;
  @override
  String? get profilePictureUrl;
  @override
  bool get isLogged;
  @override
  String? get name;
  @override
  String? get surname;
  @override
  @JsonKey(ignore: true)
  _$$UiUserImplCopyWith<_$UiUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
