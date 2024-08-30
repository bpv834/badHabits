// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get userId => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get rrn => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String get mainHabit => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;
  List<String> get habits => throw _privateConstructorUsedError;
  List<String> get joinedRooms => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String userId,
      String email,
      String name,
      String rrn,
      String gender,
      String mainHabit,
      int age,
      List<String> habits,
      List<String> joinedRooms});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? email = null,
    Object? name = null,
    Object? rrn = null,
    Object? gender = null,
    Object? mainHabit = null,
    Object? age = null,
    Object? habits = null,
    Object? joinedRooms = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rrn: null == rrn
          ? _value.rrn
          : rrn // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      mainHabit: null == mainHabit
          ? _value.mainHabit
          : mainHabit // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      habits: null == habits
          ? _value.habits
          : habits // ignore: cast_nullable_to_non_nullable
              as List<String>,
      joinedRooms: null == joinedRooms
          ? _value.joinedRooms
          : joinedRooms // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String email,
      String name,
      String rrn,
      String gender,
      String mainHabit,
      int age,
      List<String> habits,
      List<String> joinedRooms});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? email = null,
    Object? name = null,
    Object? rrn = null,
    Object? gender = null,
    Object? mainHabit = null,
    Object? age = null,
    Object? habits = null,
    Object? joinedRooms = null,
  }) {
    return _then(_$UserModelImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rrn: null == rrn
          ? _value.rrn
          : rrn // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      mainHabit: null == mainHabit
          ? _value.mainHabit
          : mainHabit // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      habits: null == habits
          ? _value._habits
          : habits // ignore: cast_nullable_to_non_nullable
              as List<String>,
      joinedRooms: null == joinedRooms
          ? _value._joinedRooms
          : joinedRooms // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl with DiagnosticableTreeMixin implements _UserModel {
  const _$UserModelImpl(
      {this.userId = 'userId',
      this.email = 'email',
      this.name = 'name',
      this.rrn = 'rrn',
      this.gender = 'gender',
      this.mainHabit = 'mainHabit',
      this.age = 0,
      final List<String> habits = const [],
      final List<String> joinedRooms = const []})
      : _habits = habits,
        _joinedRooms = joinedRooms;

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  @JsonKey()
  final String userId;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String rrn;
  @override
  @JsonKey()
  final String gender;
  @override
  @JsonKey()
  final String mainHabit;
  @override
  @JsonKey()
  final int age;
  final List<String> _habits;
  @override
  @JsonKey()
  List<String> get habits {
    if (_habits is EqualUnmodifiableListView) return _habits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_habits);
  }

  final List<String> _joinedRooms;
  @override
  @JsonKey()
  List<String> get joinedRooms {
    if (_joinedRooms is EqualUnmodifiableListView) return _joinedRooms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_joinedRooms);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserModel(userId: $userId, email: $email, name: $name, rrn: $rrn, gender: $gender, mainHabit: $mainHabit, age: $age, habits: $habits, joinedRooms: $joinedRooms)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserModel'))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('rrn', rrn))
      ..add(DiagnosticsProperty('gender', gender))
      ..add(DiagnosticsProperty('mainHabit', mainHabit))
      ..add(DiagnosticsProperty('age', age))
      ..add(DiagnosticsProperty('habits', habits))
      ..add(DiagnosticsProperty('joinedRooms', joinedRooms));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.rrn, rrn) || other.rrn == rrn) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.mainHabit, mainHabit) ||
                other.mainHabit == mainHabit) &&
            (identical(other.age, age) || other.age == age) &&
            const DeepCollectionEquality().equals(other._habits, _habits) &&
            const DeepCollectionEquality()
                .equals(other._joinedRooms, _joinedRooms));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      email,
      name,
      rrn,
      gender,
      mainHabit,
      age,
      const DeepCollectionEquality().hash(_habits),
      const DeepCollectionEquality().hash(_joinedRooms));

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {final String userId,
      final String email,
      final String name,
      final String rrn,
      final String gender,
      final String mainHabit,
      final int age,
      final List<String> habits,
      final List<String> joinedRooms}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String get userId;
  @override
  String get email;
  @override
  String get name;
  @override
  String get rrn;
  @override
  String get gender;
  @override
  String get mainHabit;
  @override
  int get age;
  @override
  List<String> get habits;
  @override
  List<String> get joinedRooms;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
