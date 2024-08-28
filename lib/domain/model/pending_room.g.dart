// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PendingRoomImpl _$$PendingRoomImplFromJson(Map<String, dynamic> json) =>
    _$PendingRoomImpl(
      creatorId: json['creatorId'] as String? ?? 'creatorId',
      roomId: json['roomId'] as String? ?? 'roomId',
      goalId: json['goalId'] as String? ?? 'goalId',
      creationDate: json['creationDate'] == null
          ? null
          : DateTime.parse(json['creationDate'] as String),
      roomName: json['roomName'] as String? ?? '방 제목',
      description: json['description'] as String? ?? '방 설명',
      duration: json['duration'] as String? ?? '기간',
      members: (json['members'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$PendingRoomImplToJson(_$PendingRoomImpl instance) =>
    <String, dynamic>{
      'creatorId': instance.creatorId,
      'roomId': instance.roomId,
      'goalId': instance.goalId,
      'creationDate': instance.creationDate?.toIso8601String(),
      'roomName': instance.roomName,
      'description': instance.description,
      'duration': instance.duration,
      'members': instance.members,
    };
