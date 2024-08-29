import 'package:bhgh/domain/usecase/get_my_creation_rooms_use_case.dart';
import 'package:bhgh/domain/usecase/get_my_waiting_rooms_use_case.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class MyViewModel with ChangeNotifier{
  final GetMyCreationRoomsUseCase _getMyCreationRoomsUseCase;
  final GetMyWaitingRoomsUseCase _getMyWaitingRoomsUseCase;

  MyViewModel(this._getMyCreationRoomsUseCase, this._getMyWaitingRoomsUseCase){
    getMyRooms();
  }

  Future<void> getMyRooms() async {
 /*   //loading중으로 변경후
    _state = _state.copyWith(isLoading: true);
    notifyListeners();
    //데이터 불러와 로딩중 해제
    List<PendingRoom> result = await _pendingRoomUseCase!.execute();
    _state = _state.copyWith(rooms: result, isLoading: false);
    notifyListeners();
    print('state.Rooms: ${_state.rooms}');*/
    _getMyCreationRoomsUseCase.execute();
    _getMyWaitingRoomsUseCase.execute();
  }
}