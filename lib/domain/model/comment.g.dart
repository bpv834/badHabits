// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentImpl _$$CommentImplFromJson(Map<String, dynamic> json) =>
    _$CommentImpl(
      commentId: json['commentId'] as String? ?? 'commentId',
      roomId: json['roomId'] as String? ?? 'roomId',
      userId: json['userId'] as String? ?? 'userId',
      content: json['content'] as String? ?? 'content',
      replies: (json['replies'] as List<dynamic>?)
              ?.map((e) => Reply.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'commentId': instance.commentId,
      'roomId': instance.roomId,
      'userId': instance.userId,
      'content': instance.content,
      'replies': instance.replies,
      'timestamp': instance.timestamp?.toIso8601String(),
    };
