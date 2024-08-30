// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GoalImpl _$$GoalImplFromJson(Map<String, dynamic> json) => _$GoalImpl(
      goalId: json['goalId'] as String? ?? 'id',
      badHabit: json['badHabit'] as String? ?? 'habit name',
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      targetDate: json['targetDate'] == null
          ? null
          : DateTime.parse(json['targetDate'] as String),
      progress: (json['progress'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as bool).toList()),
      ),
    );

Map<String, dynamic> _$$GoalImplToJson(_$GoalImpl instance) =>
    <String, dynamic>{
      'goalId': instance.goalId,
      'badHabit': instance.badHabit,
      'startDate': instance.startDate?.toIso8601String(),
      'targetDate': instance.targetDate?.toIso8601String(),
      'progress': instance.progress,
    };
