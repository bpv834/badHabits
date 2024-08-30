import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user_model.freezed.dart';

part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @Default('userId') String userId,
    @Default('email') String email,
    @Default('name') String name,
    @Default('rrn') String rrn,
    @Default('gender') String gender,
    @Default('mainHabit') String mainHabit,
    @Default(0) int age,
    @Default([]) List<String> habits,
    @Default([]) List<String> joinedRooms,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) => _$UserModelFromJson(json);
}