// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyStateImpl _$$MyStateImplFromJson(Map<String, dynamic> json) =>
    _$MyStateImpl(
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      myCreationRooms: (json['myCreationRooms'] as List<dynamic>?)
              ?.map((e) => Room.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      myPendingRooms: (json['myPendingRooms'] as List<dynamic>?)
              ?.map((e) => Room.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      myRunningRooms: (json['myRunningRooms'] as List<dynamic>?)
              ?.map((e) => Room.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      myCompleteRooms: (json['myCompleteRooms'] as List<dynamic>?)
              ?.map((e) => Room.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isLoading: json['isLoading'] as bool? ?? false,
    );

Map<String, dynamic> _$$MyStateImplToJson(_$MyStateImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'myCreationRooms': instance.myCreationRooms,
      'myPendingRooms': instance.myPendingRooms,
      'myRunningRooms': instance.myRunningRooms,
      'myCompleteRooms': instance.myCompleteRooms,
      'isLoading': instance.isLoading,
    };
