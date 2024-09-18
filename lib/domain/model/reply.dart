import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'reply.freezed.dart';

part 'reply.g.dart';

@freezed
class Reply with _$Reply {
  const factory Reply({
    @Default('replyId')final String replyId,      // 답글 고유 ID
    @Default('commentId')final String commentId,    // 속한 댓글의 ID
    @Default('userId')final String userId,       // 답글 작성자 ID
    @Default('content')final String content,      // 답글 내용
    final DateTime? timestamp,  // 답글 작성 시간
  }) = _Reply;

  factory Reply.fromJson(Map<String, Object?> json) => _$ReplyFromJson(json);
}