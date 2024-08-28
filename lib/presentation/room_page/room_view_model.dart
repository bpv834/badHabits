import 'package:bhgh/domain/model/pending_room.dart';
import 'package:bhgh/domain/usecase/get_pending_room_use_case.dart';
import 'package:bhgh/presentation/components/create_room_dialog.dart';
import 'package:bhgh/presentation/room_page/room_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

@injectable
class RoomViewModel with ChangeNotifier {
  //방 목록 불러오기 생성자를 통해
  RoomViewModel(this._pendingRoomUseCase){
    _getPendingRooms();
  }
  final GetPendingRoomUseCase _pendingRoomUseCase;

  //상태와 getter
  RoomState _state = const RoomState();
  RoomState get state => _state;

  Future<void> _getPendingRooms()async {
    //loading중으로 변경후
    _state= _state.copyWith(isLoading: true);
    notifyListeners();
    //데이터 불러와 로딩중 해제
    List<PendingRoom> result= await _pendingRoomUseCase.execute();
    _state = _state.copyWith(rooms: result, isLoading:false);
    notifyListeners();
    print('state.Rooms: ${_state.rooms}');
  }

  void showCreateGroupDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => ChangeNotifierProvider(
        create: (_) => RoomViewModel(_pendingRoomUseCase),
        child: CreateRoomDialog(),
      ),
    );
  }

  // Firestore 인스턴스를 가져옵니다.
  final FirebaseFirestore db = FirebaseFirestore.instance;


// 방을 생성하는 메서드
  Future<void> createRoom(String roomName, String badHabit, String description,
      String duration) async {
    try {
      // 목표를 생성합니다.
      final goalRef = await db.collection('goals').add({
        "goalId": '', // 나중에 업데이트 될 예정
        "badHabit": badHabit,
        "description": description,
        'creationDate': DateTime.now(),// 현재 날짜와 시간
        'targetDate': null, // 나중에 설정할 수 있도록 null
        'progress': {}, // 초기에는 빈 맵
        'status': 'pending', // 목표 상태
      });

      final goalId = goalRef.id;

      // 방을 생성합니다.
      final roomRef = await db.collection('pendingRooms').add({
        "roomId": '', // 나중에 업데이트 될 예정
        "goalId": goalId, // 방과 연결된 목표의 ID
        "creatorId": FirebaseAuth.instance.currentUser!.uid, // 현재 로그인한 사용자의 ID
        'creationDate': Timestamp.now(), // 현재 날짜와 시간
        "roomName": roomName,
        "description": description,
        "duration": duration, // 목표기간
        "members" : ['익명1'],
      });

      final roomId = roomRef.id;

      // 목표와 방 문서에 ID를 업데이트합니다.
      await goalRef.update({'goalId': goalId});
      await roomRef.update({'roomId': roomId});

      print(
          'DocumentSnapshot added with Goal ID: $goalId and Room ID: $roomId');
    } catch (e) {
      print('에러 발생: $e');
    }
  }
}
