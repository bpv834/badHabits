import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pending_room.freezed.dart';

part 'pending_room.g.dart';

@freezed
class PendingRoom with _$PendingRoom {
  const factory PendingRoom({
    @Default('creatorId') String creatorId,
    @Default('roomId') String roomId,
    @Default('goalId') String goalId,
    DateTime? creationDate,
    @Default('방 제목') String roomName,
    @Default('방 설명') String description,
    @Default('기간') String duration,
    @Default([]) List<String> members,
  }) = _PendingRoom;

  factory PendingRoom.fromJson(Map<String, Object?> json) => _$PendingRoomFromJson(json);
}