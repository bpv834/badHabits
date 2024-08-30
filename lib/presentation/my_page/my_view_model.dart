

import 'package:bhgh/domain/model/user_model.dart';
import 'package:bhgh/domain/usecase/get_my_complete_rooms_use_case.dart';
import 'package:bhgh/domain/usecase/get_my_creation_rooms_use_case.dart';
import 'package:bhgh/domain/usecase/get_my_pending_rooms_use_case.dart';
import 'package:bhgh/domain/usecase/get_my_running_rooms_use_case.dart';
import 'package:bhgh/domain/usecase/get_user_asc_use_case.dart';
import 'package:bhgh/presentation/my_page/my_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/room.dart';



@injectable
class MyViewModel with ChangeNotifier {
  final GetMyCreationRoomsUseCase _getMyCreationRoomsUseCase;
  final GetMyPendingRoomsUseCase _getMyPendingRoomsUseCase;
  final GetMyRunningRoomsUseCase _getMyRunningRoomsUseCase;
  final GetMyCompleteRoomsUseCase _getMyCompleteRoomsUseCase;
  final GetUserAscUseCase _getUserAscUseCase;

  MyViewModel(
    this._getMyCreationRoomsUseCase,
    this._getMyPendingRoomsUseCase,
    this._getMyRunningRoomsUseCase,
    this._getMyCompleteRoomsUseCase,
    this._getUserAscUseCase,
  ) {
    getMyRooms();
    getMyProfile();

  }

  MyState _state = const MyState(user: null);

  MyState get state => _state;

  Future<void> getMyRooms() async {
    //loading중으로 변경후
    _state = _state.copyWith(isLoading: true);
    notifyListeners();
    //데이터 불러와 로딩중 해제
    List<Room> myCreationRooms = await _getMyCreationRoomsUseCase.execute();
    List<Room> myPendingRooms = await _getMyPendingRoomsUseCase.execute();
    List<Room> myRunningRooms = await _getMyRunningRoomsUseCase.execute();
    List<Room> myCompleteRooms = await _getMyCompleteRoomsUseCase.execute();

    _state = _state.copyWith(
        myCreationRooms: myCreationRooms,
        myPendingRooms: myPendingRooms,
        myRunningRooms: myRunningRooms,
        myCompleteRooms: myCompleteRooms,
        isLoading: false);
    notifyListeners();
  }

  Future<void> getMyProfile() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final users = await _getUserAscUseCase.execute();
    final user =  users
        .where((UserModel user) => user.userId == FirebaseAuth.instance.currentUser!.uid)
        .toList()
        .first;
    _state= _state.copyWith(user: user);
    notifyListeners();
  }


}
