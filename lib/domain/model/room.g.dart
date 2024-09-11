// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoomImpl _$$RoomImplFromJson(Map<String, dynamic> json) => _$RoomImpl(
      roomId: json['roomId'] as String? ?? 'roomId',
      creatorId: json['creatorId'] as String? ?? 'creatorId',
      roomName: json['roomName'] as String? ?? '방 제목',
      description: json['description'] as String? ?? '방 설명',
      duration: json['duration'] as String? ?? '기간',
      members: (json['members'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      progress: (json['progress'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as bool).toList()),
      ),
      status: json['status'] as String? ?? 'pending',
      badHabit: json['badHabit'] as String? ?? '고칠 습관',
      creationDate: json['creationDate'] == null
          ? null
          : DateTime.parse(json['creationDate'] as String),
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      targetDate: json['targetDate'] == null
          ? null
          : DateTime.parse(json['targetDate'] as String),
    );

Map<String, dynamic> _$$RoomImplToJson(_$RoomImpl instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'creatorId': instance.creatorId,
      'roomName': instance.roomName,
      'description': instance.description,
      'duration': instance.duration,
      'members': instance.members,
      'progress': instance.progress,
      'status': instance.status,
      'badHabit': instance.badHabit,
      'creationDate': instance.creationDate?.toIso8601String(),
      'startDate': instance.startDate?.toIso8601String(),
      'targetDate': instance.targetDate?.toIso8601String(),
    };
