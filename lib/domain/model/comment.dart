import 'package:bhgh/domain/model/reply.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'comment.freezed.dart';

part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  const factory Comment({
    @Default('commentId')final String commentId,
    @Default('roomId')final String roomId,
    @Default('userId')final String userId,
    @Default('content')final String content,
    @Default([])final List<Reply> replies,// 답글 목록
    DateTime? timestamp,
  }) = _Comment;

  factory Comment.fromJson(Map<String, Object?> json) => _$CommentFromJson(json);
}