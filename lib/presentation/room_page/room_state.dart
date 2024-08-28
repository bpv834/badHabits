import 'package:bhgh/domain/model/pending_room.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'room_state.freezed.dart';

part 'room_state.g.dart';

@freezed
class RoomState with _$RoomState {
  const factory RoomState({
    @Default([]) List<PendingRoom> rooms,
    @Default(false) bool isLoading,
  }) = _RoomState;

  factory RoomState.fromJson(Map<String, Object?> json) => _$RoomStateFromJson(json);
}