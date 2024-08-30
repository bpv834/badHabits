import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'room.freezed.dart';

part 'room.g.dart';

@freezed
class Room with _$Room {
  const factory Room({
    @Default('roomId') String roomId,
    @Default('goalId') String goalId,
    @Default('creatorId') String creatorId,
    DateTime? creationDate,
    @Default('방 제목') String roomName,
    @Default('방 설명') String description,
    @Default('기간') String duration,
    @Default([]) List<String> members,
    @Default('pending') String status, //
  }) = _Room;

  factory Room.fromJson(Map<String, Object?> json) => _$RoomFromJson(json);
}