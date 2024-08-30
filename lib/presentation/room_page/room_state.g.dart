// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoomStateImpl _$$RoomStateImplFromJson(Map<String, dynamic> json) =>
    _$RoomStateImpl(
      rooms: (json['rooms'] as List<dynamic>?)
              ?.map((e) => Room.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isLoading: json['isLoading'] as bool? ?? false,
    );

Map<String, dynamic> _$$RoomStateImplToJson(_$RoomStateImpl instance) =>
    <String, dynamic>{
      'rooms': instance.rooms,
      'isLoading': instance.isLoading,
    };
