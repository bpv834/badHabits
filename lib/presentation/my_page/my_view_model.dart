import 'package:bhgh/domain/model/user_model.dart';
import 'package:bhgh/domain/usecase/get_my_complete_rooms_use_case.dart';
import 'package:bhgh/domain/usecase/get_my_creation_rooms_use_case.dart';
import 'package:bhgh/domain/usecase/get_my_pending_rooms_use_case.dart';
import 'package:bhgh/domain/usecase/get_my_running_rooms_use_case.dart';
import 'package:bhgh/domain/usecase/get_user_asc_use_case.dart';
import 'package:bhgh/presentation/my_page/my_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  int culLeftDay(DateTime st, DateTime fi) {
    // 종료일(fi)에서 시작일(st)을 뺀 차이를 계산
    Duration diff = fi.difference(st);

    // 남은 일수 반환
    return diff.inDays + 1;
  }

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
    final user = users
        .where((UserModel user) =>
            user.userId == FirebaseAuth.instance.currentUser!.uid)
        .toList()
        .first;
    _state = _state.copyWith(user: user);
    notifyListeners();
  }

  Future<void> convertingToRunning(String roomId) async {
    //rooms컬렉션에서 roomId로 접근
    final roomRef = FirebaseFirestore.instance.collection('rooms').doc(roomId);

    roomRef.get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        // documentSnapshot.data()의 null 여부 확인
        var data = documentSnapshot.data() as Map<String, dynamic>;
        if (data.containsKey('duration')) {
          String duration = data['duration'];
          /*List<String> members = data['members'];*/ //에러 발생 data['members']가 List<dynamic> 타입이라 타입이 달라 에러
          List<String> members = List<String>.from(data['members']);

          DateTime currentDate = DateTime.now();
          DateTime targetDate;
          int? totalDays; // 기간에 따른 총 일 수

          switch (duration) {
            case '1주':
              targetDate = currentDate.add(Duration(days: 7)); // 1주 = 7일
              totalDays = 7;
              break;
            case '2주':
              targetDate = currentDate.add(Duration(days: 14)); // 2주 = 14일
              totalDays = 14;
              break;
            case '3주':
              targetDate = currentDate.add(Duration(days: 21)); // 3주 = 21일
              totalDays = 21;
              break;
            case '4주':
              targetDate = currentDate.add(Duration(days: 28)); // 4주 = 28일
              totalDays = 28;
              break;
            default:
              targetDate = currentDate; // 기본값: 현재 날짜를 그대로 사용
              print('알 수 없는 기간: $duration');
          }

          // members 리스트를 활용해 progress Map을 만듭니다. 각 멤버에게 빈 List<bool>을 할당.
          Map<String, List<bool>> progress = {};

          for (String member in members) {
            progress[member] = List.generate(
                totalDays!, (index) => false); // 기간에 맞게 false 리스트 생성
          }

          // Firestore에 update
          roomRef.update({
            'members': members,
            'startDate': DateTime.now(),
            'progress': progress, // 생성된 progress Map
            'targetDate': targetDate
          }).then((_) {
            print("room 업데이트 완료");
          }).catchError((error) {
            print("room 업데이트 중 오류 발생: $error");
          });
        } else {
          print("duration이 존재하지 않습니다.");
        }
      } else {
        print('해당 문서가 존재하지 않습니다.');
      }
    }).catchError((error) {
      print("문서를 가져오는 중 오류 발생: $error");
    });
    await roomRef.update({'status': 'running'});
  }

  Future<void> convertingToComplete(String roomId) async {
    //rooms컬렉션에서 roomId로 접근
    final roomRef = FirebaseFirestore.instance.collection('rooms').doc(roomId);

    // Firestore에 update
    roomRef.update({
      'status': 'complete',
    });
  }
}
