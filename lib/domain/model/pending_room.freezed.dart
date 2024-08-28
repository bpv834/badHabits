// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pending_room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PendingRoom _$PendingRoomFromJson(Map<String, dynamic> json) {
  return _PendingRoom.fromJson(json);
}

/// @nodoc
mixin _$PendingRoom {
  String get creatorId => throw _privateConstructorUsedError;
  String get roomId => throw _privateConstructorUsedError;
  String get goalId => throw _privateConstructorUsedError;
  DateTime? get creationDate => throw _privateConstructorUsedError;
  String get roomName => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get duration => throw _privateConstructorUsedError;
  List<String> get members => throw _privateConstructorUsedError;

  /// Serializes this PendingRoom to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PendingRoom
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PendingRoomCopyWith<PendingRoom> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PendingRoomCopyWith<$Res> {
  factory $PendingRoomCopyWith(
          PendingRoom value, $Res Function(PendingRoom) then) =
      _$PendingRoomCopyWithImpl<$Res, PendingRoom>;
  @useResult
  $Res call(
      {String creatorId,
      String roomId,
      String goalId,
      DateTime? creationDate,
      String roomName,
      String description,
      String duration,
      List<String> members});
}

/// @nodoc
class _$PendingRoomCopyWithImpl<$Res, $Val extends PendingRoom>
    implements $PendingRoomCopyWith<$Res> {
  _$PendingRoomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PendingRoom
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creatorId = null,
    Object? roomId = null,
    Object? goalId = null,
    Object? creationDate = freezed,
    Object? roomName = null,
    Object? description = null,
    Object? duration = null,
    Object? members = null,
  }) {
    return _then(_value.copyWith(
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      goalId: null == goalId
          ? _value.goalId
          : goalId // ignore: cast_nullable_to_non_nullable
              as String,
      creationDate: freezed == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      roomName: null == roomName
          ? _value.roomName
          : roomName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PendingRoomImplCopyWith<$Res>
    implements $PendingRoomCopyWith<$Res> {
  factory _$$PendingRoomImplCopyWith(
          _$PendingRoomImpl value, $Res Function(_$PendingRoomImpl) then) =
      __$$PendingRoomImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String creatorId,
      String roomId,
      String goalId,
      DateTime? creationDate,
      String roomName,
      String description,
      String duration,
      List<String> members});
}

/// @nodoc
class __$$PendingRoomImplCopyWithImpl<$Res>
    extends _$PendingRoomCopyWithImpl<$Res, _$PendingRoomImpl>
    implements _$$PendingRoomImplCopyWith<$Res> {
  __$$PendingRoomImplCopyWithImpl(
      _$PendingRoomImpl _value, $Res Function(_$PendingRoomImpl) _then)
      : super(_value, _then);

  /// Create a copy of PendingRoom
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creatorId = null,
    Object? roomId = null,
    Object? goalId = null,
    Object? creationDate = freezed,
    Object? roomName = null,
    Object? description = null,
    Object? duration = null,
    Object? members = null,
  }) {
    return _then(_$PendingRoomImpl(
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      goalId: null == goalId
          ? _value.goalId
          : goalId // ignore: cast_nullable_to_non_nullable
              as String,
      creationDate: freezed == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      roomName: null == roomName
          ? _value.roomName
          : roomName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      members: null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PendingRoomImpl implements _PendingRoom {
  const _$PendingRoomImpl(
      {this.creatorId = 'creatorId',
      this.roomId = 'roomId',
      this.goalId = 'goalId',
      this.creationDate,
      this.roomName = '방 제목',
      this.description = '방 설명',
      this.duration = '기간',
      final List<String> members = const []})
      : _members = members;

  factory _$PendingRoomImpl.fromJson(Map<String, dynamic> json) =>
      _$$PendingRoomImplFromJson(json);

  @override
  @JsonKey()
  final String creatorId;
  @override
  @JsonKey()
  final String roomId;
  @override
  @JsonKey()
  final String goalId;
  @override
  final DateTime? creationDate;
  @override
  @JsonKey()
  final String roomName;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String duration;
  final List<String> _members;
  @override
  @JsonKey()
  List<String> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  @override
  String toString() {
    return 'PendingRoom(creatorId: $creatorId, roomId: $roomId, goalId: $goalId, creationDate: $creationDate, roomName: $roomName, description: $description, duration: $duration, members: $members)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PendingRoomImpl &&
            (identical(other.creatorId, creatorId) ||
                other.creatorId == creatorId) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.goalId, goalId) || other.goalId == goalId) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate) &&
            (identical(other.roomName, roomName) ||
                other.roomName == roomName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            const DeepCollectionEquality().equals(other._members, _members));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      creatorId,
      roomId,
      goalId,
      creationDate,
      roomName,
      description,
      duration,
      const DeepCollectionEquality().hash(_members));

  /// Create a copy of PendingRoom
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PendingRoomImplCopyWith<_$PendingRoomImpl> get copyWith =>
      __$$PendingRoomImplCopyWithImpl<_$PendingRoomImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PendingRoomImplToJson(
      this,
    );
  }
}

abstract class _PendingRoom implements PendingRoom {
  const factory _PendingRoom(
      {final String creatorId,
      final String roomId,
      final String goalId,
      final DateTime? creationDate,
      final String roomName,
      final String description,
      final String duration,
      final List<String> members}) = _$PendingRoomImpl;

  factory _PendingRoom.fromJson(Map<String, dynamic> json) =
      _$PendingRoomImpl.fromJson;

  @override
  String get creatorId;
  @override
  String get roomId;
  @override
  String get goalId;
  @override
  DateTime? get creationDate;
  @override
  String get roomName;
  @override
  String get description;
  @override
  String get duration;
  @override
  List<String> get members;

  /// Create a copy of PendingRoom
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PendingRoomImplCopyWith<_$PendingRoomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
