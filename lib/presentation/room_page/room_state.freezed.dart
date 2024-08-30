// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RoomState _$RoomStateFromJson(Map<String, dynamic> json) {
  return _RoomState.fromJson(json);
}

/// @nodoc
mixin _$RoomState {
  List<Room> get rooms => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  /// Serializes this RoomState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RoomState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RoomStateCopyWith<RoomState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomStateCopyWith<$Res> {
  factory $RoomStateCopyWith(RoomState value, $Res Function(RoomState) then) =
      _$RoomStateCopyWithImpl<$Res, RoomState>;
  @useResult
  $Res call({List<Room> rooms, bool isLoading});
}

/// @nodoc
class _$RoomStateCopyWithImpl<$Res, $Val extends RoomState>
    implements $RoomStateCopyWith<$Res> {
  _$RoomStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RoomState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rooms = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      rooms: null == rooms
          ? _value.rooms
          : rooms // ignore: cast_nullable_to_non_nullable
              as List<Room>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoomStateImplCopyWith<$Res>
    implements $RoomStateCopyWith<$Res> {
  factory _$$RoomStateImplCopyWith(
          _$RoomStateImpl value, $Res Function(_$RoomStateImpl) then) =
      __$$RoomStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Room> rooms, bool isLoading});
}

/// @nodoc
class __$$RoomStateImplCopyWithImpl<$Res>
    extends _$RoomStateCopyWithImpl<$Res, _$RoomStateImpl>
    implements _$$RoomStateImplCopyWith<$Res> {
  __$$RoomStateImplCopyWithImpl(
      _$RoomStateImpl _value, $Res Function(_$RoomStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RoomState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rooms = null,
    Object? isLoading = null,
  }) {
    return _then(_$RoomStateImpl(
      rooms: null == rooms
          ? _value._rooms
          : rooms // ignore: cast_nullable_to_non_nullable
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
class _$RoomStateImpl with DiagnosticableTreeMixin implements _RoomState {
  const _$RoomStateImpl(
      {final List<Room> rooms = const [], this.isLoading = false})
      : _rooms = rooms;

  factory _$RoomStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomStateImplFromJson(json);

  final List<Room> _rooms;
  @override
  @JsonKey()
  List<Room> get rooms {
    if (_rooms is EqualUnmodifiableListView) return _rooms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rooms);
  }

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RoomState(rooms: $rooms, isLoading: $isLoading)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RoomState'))
      ..add(DiagnosticsProperty('rooms', rooms))
      ..add(DiagnosticsProperty('isLoading', isLoading));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomStateImpl &&
            const DeepCollectionEquality().equals(other._rooms, _rooms) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_rooms), isLoading);

  /// Create a copy of RoomState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomStateImplCopyWith<_$RoomStateImpl> get copyWith =>
      __$$RoomStateImplCopyWithImpl<_$RoomStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoomStateImplToJson(
      this,
    );
  }
}

abstract class _RoomState implements RoomState {
  const factory _RoomState({final List<Room> rooms, final bool isLoading}) =
      _$RoomStateImpl;

  factory _RoomState.fromJson(Map<String, dynamic> json) =
      _$RoomStateImpl.fromJson;

  @override
  List<Room> get rooms;
  @override
  bool get isLoading;

  /// Create a copy of RoomState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoomStateImplCopyWith<_$RoomStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
