// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoomImpl _$$RoomImplFromJson(Map<String, dynamic> json) => _$RoomImpl(
      roomId: json['roomId'] as String? ?? 'roomId',
      goalId: json['goalId'] as String? ?? 'goalId',
      creatorId: json['creatorId'] as String? ?? 'creatorId',
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
      status: json['status'] as String? ?? 'pending',
    );

Map<String, dynamic> _$$RoomImplToJson(_$RoomImpl instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'goalId': instance.goalId,
      'creatorId': instance.creatorId,
      'creationDate': instance.creationDate?.toIso8601String(),
      'roomName': instance.roomName,
      'description': instance.description,
      'duration': instance.duration,
      'members': instance.members,
      'status': instance.status,
    };
