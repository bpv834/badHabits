// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reply.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Reply _$ReplyFromJson(Map<String, dynamic> json) {
  return _Reply.fromJson(json);
}

/// @nodoc
mixin _$Reply {
  String get replyId => throw _privateConstructorUsedError; // 답글 고유 ID
  String get commentId => throw _privateConstructorUsedError; // 속한 댓글의 ID
  String get userId => throw _privateConstructorUsedError; // 답글 작성자 ID
  String get content => throw _privateConstructorUsedError; // 답글 내용
  DateTime? get timestamp => throw _privateConstructorUsedError;

  /// Serializes this Reply to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Reply
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReplyCopyWith<Reply> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReplyCopyWith<$Res> {
  factory $ReplyCopyWith(Reply value, $Res Function(Reply) then) =
      _$ReplyCopyWithImpl<$Res, Reply>;
  @useResult
  $Res call(
      {String replyId,
      String commentId,
      String userId,
      String content,
      DateTime? timestamp});
}

/// @nodoc
class _$ReplyCopyWithImpl<$Res, $Val extends Reply>
    implements $ReplyCopyWith<$Res> {
  _$ReplyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Reply
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? replyId = null,
    Object? commentId = null,
    Object? userId = null,
    Object? content = null,
    Object? timestamp = freezed,
  }) {
    return _then(_value.copyWith(
      replyId: null == replyId
          ? _value.replyId
          : replyId // ignore: cast_nullable_to_non_nullable
              as String,
      commentId: null == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReplyImplCopyWith<$Res> implements $ReplyCopyWith<$Res> {
  factory _$$ReplyImplCopyWith(
          _$ReplyImpl value, $Res Function(_$ReplyImpl) then) =
      __$$ReplyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String replyId,
      String commentId,
      String userId,
      String content,
      DateTime? timestamp});
}

/// @nodoc
class __$$ReplyImplCopyWithImpl<$Res>
    extends _$ReplyCopyWithImpl<$Res, _$ReplyImpl>
    implements _$$ReplyImplCopyWith<$Res> {
  __$$ReplyImplCopyWithImpl(
      _$ReplyImpl _value, $Res Function(_$ReplyImpl) _then)
      : super(_value, _then);

  /// Create a copy of Reply
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? replyId = null,
    Object? commentId = null,
    Object? userId = null,
    Object? content = null,
    Object? timestamp = freezed,
  }) {
    return _then(_$ReplyImpl(
      replyId: null == replyId
          ? _value.replyId
          : replyId // ignore: cast_nullable_to_non_nullable
              as String,
      commentId: null == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReplyImpl with DiagnosticableTreeMixin implements _Reply {
  const _$ReplyImpl(
      {this.replyId = 'replyId',
      this.commentId = 'commentId',
      this.userId = 'userId',
      this.content = 'content',
      this.timestamp});

  factory _$ReplyImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReplyImplFromJson(json);

  @override
  @JsonKey()
  final String replyId;
// 답글 고유 ID
  @override
  @JsonKey()
  final String commentId;
// 속한 댓글의 ID
  @override
  @JsonKey()
  final String userId;
// 답글 작성자 ID
  @override
  @JsonKey()
  final String content;
// 답글 내용
  @override
  final DateTime? timestamp;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Reply(replyId: $replyId, commentId: $commentId, userId: $userId, content: $content, timestamp: $timestamp)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Reply'))
      ..add(DiagnosticsProperty('replyId', replyId))
      ..add(DiagnosticsProperty('commentId', commentId))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('timestamp', timestamp));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReplyImpl &&
            (identical(other.replyId, replyId) || other.replyId == replyId) &&
            (identical(other.commentId, commentId) ||
                other.commentId == commentId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, replyId, commentId, userId, content, timestamp);

  /// Create a copy of Reply
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReplyImplCopyWith<_$ReplyImpl> get copyWith =>
      __$$ReplyImplCopyWithImpl<_$ReplyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReplyImplToJson(
      this,
    );
  }
}

abstract class _Reply implements Reply {
  const factory _Reply(
      {final String replyId,
      final String commentId,
      final String userId,
      final String content,
      final DateTime? timestamp}) = _$ReplyImpl;

  factory _Reply.fromJson(Map<String, dynamic> json) = _$ReplyImpl.fromJson;

  @override
  String get replyId; // 답글 고유 ID
  @override
  String get commentId; // 속한 댓글의 ID
  @override
  String get userId; // 답글 작성자 ID
  @override
  String get content; // 답글 내용
  @override
  DateTime? get timestamp;

  /// Create a copy of Reply
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReplyImplCopyWith<_$ReplyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
