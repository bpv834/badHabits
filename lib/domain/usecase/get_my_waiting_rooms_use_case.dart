import 'package:bhgh/domain/repository/pending_room_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../model/pending_room.dart';

@singleton
class GetMyWaitingRoomsUseCase {
  final PendingRoomRepository _roomRepository;

  GetMyWaitingRoomsUseCase({required PendingRoomRepository roomRepository})
      : _roomRepository = roomRepository;

  Future<List<PendingRoom>> execute() async {
    List<PendingRoom> list =await _roomRepository.getRooms();
    List<PendingRoom> waitingRooms = list.where((room)=>room.members.contains( FirebaseAuth.instance.currentUser!.uid)).toList();
    print('waitingRooms: $waitingRooms');

    return waitingRooms;
  }
}
