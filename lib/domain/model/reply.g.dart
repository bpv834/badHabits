// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reply.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReplyImpl _$$ReplyImplFromJson(Map<String, dynamic> json) => _$ReplyImpl(
      replyId: json['replyId'] as String? ?? 'replyId',
      commentId: json['commentId'] as String? ?? 'commentId',
      userId: json['userId'] as String? ?? 'userId',
      content: json['content'] as String? ?? 'content',
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$ReplyImplToJson(_$ReplyImpl instance) =>
    <String, dynamic>{
      'replyId': instance.replyId,
      'commentId': instance.commentId,
      'userId': instance.userId,
      'content': instance.content,
      'timestamp': instance.timestamp?.toIso8601String(),
    };
