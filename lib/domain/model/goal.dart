import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'goal.freezed.dart';

part 'goal.g.dart';

@freezed
class Goal with _$Goal {
  const factory Goal({
    @Default('id') String goalId, // 목표의 고유 ID
    @Default('name') String name, // 목표의 이름
    @Default('des') String description, // 목표에 대한 설명
    DateTime? startDate, // 목표 시작일
    DateTime? endDate, // 목표 종료일
    Map<String, List<bool>>? progress, // 참가자 ID와 그들의 진척도 리스트를 매핑
  }) = _Goal;

  factory Goal.fromJson(Map<String, Object?> json) => _$GoalFromJson(json);
}
