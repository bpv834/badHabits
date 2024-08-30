// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MyState _$MyStateFromJson(Map<String, dynamic> json) {
  return _MyState.fromJson(json);
}

/// @nodoc
mixin _$MyState {
  UserModel? get user => throw _privateConstructorUsedError;
  List<Room> get myCreationRooms => throw _privateConstructorUsedError;
  List<Room> get myPendingRooms => throw _privateConstructorUsedError;
  List<Room> get myRunningRooms => throw _privateConstructorUsedError;
  List<Room> get myCompleteRooms => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  /// Serializes this MyState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyStateCopyWith<MyState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyStateCopyWith<$Res> {
  factory $MyStateCopyWith(MyState value, $Res Function(MyState) then) =
      _$MyStateCopyWithImpl<$Res, MyState>;
  @useResult
  $Res call(
      {UserModel? user,
      List<Room> myCreationRooms,
      List<Room> myPendingRooms,
      List<Room> myRunningRooms,
      List<Room> myCompleteRooms,
      bool isLoading});

  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$MyStateCopyWithImpl<$Res, $Val extends MyState>
    implements $MyStateCopyWith<$Res> {
  _$MyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? myCreationRooms = null,
    Object? myPendingRooms = null,
    Object? myRunningRooms = null,
    Object? myCompleteRooms = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      myCreationRooms: null == myCreationRooms
          ? _value.myCreationRooms
          : myCreationRooms // ignore: cast_nullable_to_non_nullable
              as List<Room>,
      myPendingRooms: null == myPendingRooms
          ? _value.myPendingRooms
          : myPendingRooms // ignore: cast_nullable_to_non_nullable
              as List<Room>,
      myRunningRooms: null == myRunningRooms
          ? _value.myRunningRooms
          : myRunningRooms // ignore: cast_nullable_to_non_nullable
              as List<Room>,
      myCompleteRooms: null == myCompleteRooms
          ? _value.myCompleteRooms
          : myCompleteRooms // ignore: cast_nullable_to_non_nullable
              as List<Room>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of MyState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MyStateImplCopyWith<$Res> implements $MyStateCopyWith<$Res> {
  factory _$$MyStateImplCopyWith(
          _$MyStateImpl value, $Res Function(_$MyStateImpl) then) =
      __$$MyStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserModel? user,
      List<Room> myCreationRooms,
      List<Room> myPendingRooms,
      List<Room> myRunningRooms,
      List<Room> myCompleteRooms,
      bool isLoading});

  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$MyStateImplCopyWithImpl<$Res>
    extends _$MyStateCopyWithImpl<$Res, _$MyStateImpl>
    implements _$$MyStateImplCopyWith<$Res> {
  __$$MyStateImplCopyWithImpl(
      _$MyStateImpl _value, $Res Function(_$MyStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? myCreationRooms = null,
    Object? myPendingRooms = null,
    Object? myRunningRooms = null,
    Object? myCompleteRooms = null,
    Object? isLoading = null,
  }) {
    return _then(_$MyStateImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      myCreationRooms: null == myCreationRooms
          ? _value._myCreationRooms
          : myCreationRooms // ignore: cast_nullable_to_non_nullable
              as List<Room>,
      myPendingRooms: null == myPendingRooms
          ? _value._myPendingRooms
          : myPendingRooms // ignore: cast_nullable_to_non_nullable
              as List<Room>,
      myRunningRooms: null == myRunningRooms
          ? _value._myRunningRooms
          : myRunningRooms // ignore: cast_nullable_to_non_nullable
              as List<Room>,
      myCompleteRooms: null == myCompleteRooms
          ? _value._myCompleteRooms
          : myCompleteRooms // ignore: cast_nullable_to_non_nullable
              as List<Room>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyStateImpl with DiagnosticableTreeMixin implements _MyState {
  const _$MyStateImpl(
      {required this.user,
      final List<Room> myCreationRooms = const [],
      final List<Room> myPendingRooms = const [],
      final List<Room> myRunningRooms = const [],
      final List<Room> myCompleteRooms = const [],
      this.isLoading = false})
      : _myCreationRooms = myCreationRooms,
        _myPendingRooms = myPendingRooms,
        _myRunningRooms = myRunningRooms,
        _myCompleteRooms = myCompleteRooms;

  factory _$MyStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyStateImplFromJson(json);

  @override
  final UserModel? user;
  final List<Room> _myCreationRooms;
  @override
  @JsonKey()
  List<Room> get myCreationRooms {
    if (_myCreationRooms is EqualUnmodifiableListView) return _myCreationRooms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_myCreationRooms);
  }

  final List<Room> _myPendingRooms;
  @override
  @JsonKey()
  List<Room> get myPendingRooms {
    if (_myPendingRooms is EqualUnmodifiableListView) return _myPendingRooms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_myPendingRooms);
  }

  final List<Room> _myRunningRooms;
  @override
  @JsonKey()
  List<Room> get myRunningRooms {
    if (_myRunningRooms is EqualUnmodifiableListView) return _myRunningRooms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_myRunningRooms);
  }

  final List<Room> _myCompleteRooms;
  @override
  @JsonKey()
  List<Room> get myCompleteRooms {
    if (_myCompleteRooms is EqualUnmodifiableListView) return _myCompleteRooms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_myCompleteRooms);
  }

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MyState(user: $user, myCreationRooms: $myCreationRooms, myPendingRooms: $myPendingRooms, myRunningRooms: $myRunningRooms, myCompleteRooms: $myCompleteRooms, isLoading: $isLoading)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MyState'))
      ..add(DiagnosticsProperty('user', user))
      ..add(DiagnosticsProperty('myCreationRooms', myCreationRooms))
      ..add(DiagnosticsProperty('myPendingRooms', myPendingRooms))
      ..add(DiagnosticsProperty('myRunningRooms', myRunningRooms))
      ..add(DiagnosticsProperty('myCompleteRooms', myCompleteRooms))
      ..add(DiagnosticsProperty('isLoading', isLoading));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyStateImpl &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality()
                .equals(other._myCreationRooms, _myCreationRooms) &&
            const DeepCollectionEquality()
                .equals(other._myPendingRooms, _myPendingRooms) &&
            const DeepCollectionEquality()
                .equals(other._myRunningRooms, _myRunningRooms) &&
            const DeepCollectionEquality()
                .equals(other._myCompleteRooms, _myCompleteRooms) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      user,
      const DeepCollectionEquality().hash(_myCreationRooms),
      const DeepCollectionEquality().hash(_myPendingRooms),
      const DeepCollectionEquality().hash(_myRunningRooms),
      const DeepCollectionEquality().hash(_myCompleteRooms),
      isLoading);

  /// Create a copy of MyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyStateImplCopyWith<_$MyStateImpl> get copyWith =>
      __$$MyStateImplCopyWithImpl<_$MyStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyStateImplToJson(
      this,
    );
  }
}

abstract class _MyState implements MyState {
  const factory _MyState(
      {required final UserModel? user,
      final List<Room> myCreationRooms,
      final List<Room> myPendingRooms,
      final List<Room> myRunningRooms,
      final List<Room> myCompleteRooms,
      final bool isLoading}) = _$MyStateImpl;

  factory _MyState.fromJson(Map<String, dynamic> json) = _$MyStateImpl.fromJson;

  @override
  UserModel? get user;
  @override
  List<Room> get myCreationRooms;
  @override
  List<Room> get myPendingRooms;
  @override
  List<Room> get myRunningRooms;
  @override
  List<Room> get myCompleteRooms;
  @override
  bool get isLoading;

  /// Create a copy of MyState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyStateImplCopyWith<_$MyStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
