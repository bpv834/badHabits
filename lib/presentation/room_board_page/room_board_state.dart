import 'package:bhgh/domain/model/comment.dart';
import 'package:bhgh/domain/model/reply.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'room_board_state.freezed.dart';

part 'room_board_state.g.dart';

@freezed
class RoomBoardState with _$RoomBoardState {
  const factory RoomBoardState({
    @Default(false) bool isLoading,
    @Default(false) bool isReplyLoading,
    @Default({}) Map<String, List<bool>> mutableProgress,
    @Default([]) List<Comment> comments,
    @Default([]) List<Reply> replies,
  }) = _RoomBoardState;

  factory RoomBoardState.fromJson(Map<String, Object?> json) =>
      _$RoomBoardStateFromJson(json);
}
