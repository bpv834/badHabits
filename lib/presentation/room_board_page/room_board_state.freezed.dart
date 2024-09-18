// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_board_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RoomBoardState _$RoomBoardStateFromJson(Map<String, dynamic> json) {
  return _RoomBoardState.fromJson(json);
}

/// @nodoc
mixin _$RoomBoardState {
  bool get isLoading => throw _privateConstructorUsedError;
  Map<String, List<bool>> get mutableProgress =>
      throw _privateConstructorUsedError;
  List<Comment> get comments => throw _privateConstructorUsedError;
  List<Reply> get replies => throw _privateConstructorUsedError;

  /// Serializes this RoomBoardState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RoomBoardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RoomBoardStateCopyWith<RoomBoardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomBoardStateCopyWith<$Res> {
  factory $RoomBoardStateCopyWith(
          RoomBoardState value, $Res Function(RoomBoardState) then) =
      _$RoomBoardStateCopyWithImpl<$Res, RoomBoardState>;
  @useResult
  $Res call(
      {bool isLoading,
      Map<String, List<bool>> mutableProgress,
      List<Comment> comments,
      List<Reply> replies});
}

/// @nodoc
class _$RoomBoardStateCopyWithImpl<$Res, $Val extends RoomBoardState>
    implements $RoomBoardStateCopyWith<$Res> {
  _$RoomBoardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RoomBoardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? mutableProgress = null,
    Object? comments = null,
    Object? replies = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      mutableProgress: null == mutableProgress
          ? _value.mutableProgress
          : mutableProgress // ignore: cast_nullable_to_non_nullable
              as Map<String, List<bool>>,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>,
      replies: null == replies
          ? _value.replies
          : replies // ignore: cast_nullable_to_non_nullable
              as List<Reply>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoomBoardStateImplCopyWith<$Res>
    implements $RoomBoardStateCopyWith<$Res> {
  factory _$$RoomBoardStateImplCopyWith(_$RoomBoardStateImpl value,
          $Res Function(_$RoomBoardStateImpl) then) =
      __$$RoomBoardStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      Map<String, List<bool>> mutableProgress,
      List<Comment> comments,
      List<Reply> replies});
}

/// @nodoc
class __$$RoomBoardStateImplCopyWithImpl<$Res>
    extends _$RoomBoardStateCopyWithImpl<$Res, _$RoomBoardStateImpl>
    implements _$$RoomBoardStateImplCopyWith<$Res> {
  __$$RoomBoardStateImplCopyWithImpl(
      _$RoomBoardStateImpl _value, $Res Function(_$RoomBoardStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RoomBoardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? mutableProgress = null,
    Object? comments = null,
    Object? replies = null,
  }) {
    return _then(_$RoomBoardStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      mutableProgress: null == mutableProgress
          ? _value._mutableProgress
          : mutableProgress // ignore: cast_nullable_to_non_nullable
              as Map<String, List<bool>>,
      comments: null == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>,
      replies: null == replies
          ? _value._replies
          : replies // ignore: cast_nullable_to_non_nullable
              as List<Reply>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoomBoardStateImpl
    with DiagnosticableTreeMixin
    implements _RoomBoardState {
  const _$RoomBoardStateImpl(
      {this.isLoading = false,
      final Map<String, List<bool>> mutableProgress = const {},
      final List<Comment> comments = const [],
      final List<Reply> replies = const []})
      : _mutableProgress = mutableProgress,
        _comments = comments,
        _replies = replies;

  factory _$RoomBoardStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomBoardStateImplFromJson(json);

  @override
  @JsonKey()
  final bool isLoading;
  final Map<String, List<bool>> _mutableProgress;
  @override
  @JsonKey()
  Map<String, List<bool>> get mutableProgress {
    if (_mutableProgress is EqualUnmodifiableMapView) return _mutableProgress;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_mutableProgress);
  }

  final List<Comment> _comments;
  @override
  @JsonKey()
  List<Comment> get comments {
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  final List<Reply> _replies;
  @override
  @JsonKey()
  List<Reply> get replies {
    if (_replies is EqualUnmodifiableListView) return _replies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_replies);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RoomBoardState(isLoading: $isLoading, mutableProgress: $mutableProgress, comments: $comments, replies: $replies)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RoomBoardState'))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('mutableProgress', mutableProgress))
      ..add(DiagnosticsProperty('comments', comments))
      ..add(DiagnosticsProperty('replies', replies));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomBoardStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._mutableProgress, _mutableProgress) &&
            const DeepCollectionEquality().equals(other._comments, _comments) &&
            const DeepCollectionEquality().equals(other._replies, _replies));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_mutableProgress),
      const DeepCollectionEquality().hash(_comments),
      const DeepCollectionEquality().hash(_replies));

  /// Create a copy of RoomBoardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomBoardStateImplCopyWith<_$RoomBoardStateImpl> get copyWith =>
      __$$RoomBoardStateImplCopyWithImpl<_$RoomBoardStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoomBoardStateImplToJson(
      this,
    );
  }
}

abstract class _RoomBoardState implements RoomBoardState {
  const factory _RoomBoardState(
      {final bool isLoading,
      final Map<String, List<bool>> mutableProgress,
      final List<Comment> comments,
      final List<Reply> replies}) = _$RoomBoardStateImpl;

  factory _RoomBoardState.fromJson(Map<String, dynamic> json) =
      _$RoomBoardStateImpl.fromJson;

  @override
  bool get isLoading;
  @override
  Map<String, List<bool>> get mutableProgress;
  @override
  List<Comment> get comments;
  @override
  List<Reply> get replies;

  /// Create a copy of RoomBoardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoomBoardStateImplCopyWith<_$RoomBoardStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
