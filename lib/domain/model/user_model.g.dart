// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      userId: json['userId'] as String? ?? 'userId',
      email: json['email'] as String? ?? 'email',
      name: json['name'] as String? ?? 'name',
      rrn: json['rrn'] as String? ?? 'rrn',
      gender: json['gender'] as String? ?? 'gender',
      mainHabit: json['mainHabit'] as String? ?? 'mainHabit',
      age: (json['age'] as num?)?.toInt() ?? 0,
      habits: (json['habits'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      joinedRooms: (json['joinedRooms'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'email': instance.email,
      'name': instance.name,
      'rrn': instance.rrn,
      'gender': instance.gender,
      'mainHabit': instance.mainHabit,
      'age': instance.age,
      'habits': instance.habits,
      'joinedRooms': instance.joinedRooms,
    };
