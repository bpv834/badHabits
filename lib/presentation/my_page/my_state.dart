import 'package:bhgh/domain/model/room.dart';
import 'package:bhgh/domain/model/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'my_state.freezed.dart';

part 'my_state.g.dart';

@freezed
class MyState with _$MyState {
  const factory MyState({
    required UserModel? user,
    @Default([]) List<Room> myCreationRooms,
    @Default([]) List<Room> myPendingRooms,
    @Default([]) List<Room> myRunningRooms,
    @Default([]) List<Room> myCompleteRooms,
    @Default(false) bool isLoading,
  }) = _MyState;

  factory MyState.fromJson(Map<String, Object?> json) =>
      _$MyStateFromJson(json);
}
