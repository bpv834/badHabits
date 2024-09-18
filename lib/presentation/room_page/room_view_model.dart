import 'package:bhgh/domain/model/room.dart';
import 'package:bhgh/domain/usecase/get_rooms_use_case.dart';
import 'package:bhgh/presentation/room_page/components/create_room_dialog.dart';
import 'package:bhgh/presentation/room_page/room_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

@injectable
class RoomViewModel with ChangeNotifier {
  //방 목록 불러오기 생성자를 통해
  RoomViewModel(this._roomUseCase) {
    if (_roomUseCase == null) {
      print('현재 위치 : room_view_model/_pendingRoomUseCase = null');
    } else {
      getPendingRooms();
    }
  }

  final GetRoomsUseCase? _roomUseCase;

  //상태와 getter
  RoomState _state = const RoomState();

  RoomState get state => _state;

  Future<void> joinRoomAsId(String roomId,BuildContext context) async {
    final roomsDoc =
        FirebaseFirestore.instance.collection('rooms').doc(roomId);

    // Transaction을 사용하여 필드 업데이트
    FirebaseFirestore.instance.runTransaction((transaction) async {
      final snapshot = await transaction.get(roomsDoc);

      if (!snapshot.exists) {
        print('현재 위치 : room_view_model/방이 존재하지 않습니다.');
        return;
      }

      List<dynamic> members = snapshot['members'] ?? [];

      if (members.contains(FirebaseAuth.instance.currentUser!.uid)) {
        print('현재 위치 : room_view_model/이미 있어요');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('현재 위치 : room_view_model/이미 참여중입니다!ㅠ')),
        );

      } else {
        members.add(FirebaseAuth.instance.currentUser!.uid);
        transaction.update(roomsDoc, {'members': members});
        print('현재 위치 : room_view_model/멤버에 추가되었습니다.');

        // 사용자의 joinedRoom 필드 업데이트
        final userRef =
            db.collection('users').doc(FirebaseAuth.instance.currentUser!.uid);
        await userRef.update({
          'joinedRoom': FieldValue.arrayUnion([roomId])
        });
      }
    }).catchError((error) {
      print('현재 위치 : room_view_model/방 참가 중 오류 발생: $error');
    });
  }

  Future<void> getPendingRooms() async {
    //loading중으로 변경후
    _state = _state.copyWith(isLoading: true);
    notifyListeners();
    //데이터 불러와 로딩중 해제
    List<Room> result = await _roomUseCase!.execute();
    _state = _state.copyWith(rooms: result, isLoading: false);
    notifyListeners();
  }

  void showCreateGroupDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => ChangeNotifierProvider(
        create: (_) => RoomViewModel(_roomUseCase),
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

      // 방을 생성합니다.
      final roomRef = await db.collection('rooms').add({
        "roomId": '', // 나중에 업데이트 될 예정
        "creatorId": FirebaseAuth.instance.currentUser!.uid, // 현재 로그인한 사용자의 ID
        'creationDate': Timestamp.now(), // 현재 날짜와 시간
        "roomName": roomName,
        "description": description,
        "duration": duration, // 목표기간
        "members": ['${FirebaseAuth.instance.currentUser!.uid}'],
        "status" : 'pending',
        "badHabit": badHabit,
        'startDate': null, // 현재 날짜와 시간
        'targetDate': null, // 나중에 설정할 수 있도록 null
        'progress': {}, // 초기에는 빈 맵
      });

      final roomId = roomRef.id;

      // 목표와 방 문서에 ID를 업데이트합니다.
      await roomRef.update({'roomId': roomId});

      // 사용자의 joinedRoom 필드 업데이트
      final userRef =
          db.collection('users').doc(FirebaseAuth.instance.currentUser!.uid);
      await userRef.update({
        'joinedRoom': FieldValue.arrayUnion([roomId])
      });

      print(
          '현재 위치 : room_view_model/DocumentSnapshot added and Room ID: $roomId');
    } catch (e) {
      print('현재 위치 : room_view_model/에러 발생: $e');
    }
  }
}
