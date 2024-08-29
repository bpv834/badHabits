import 'package:bhgh/domain/repository/pending_room_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../model/pending_room.dart';

@singleton
class GetMyCreationRoomsUseCase {
  final PendingRoomRepository _roomRepository;

  GetMyCreationRoomsUseCase({required PendingRoomRepository roomRepository})
      : _roomRepository = roomRepository;

  Future<List<PendingRoom>> execute() async {
    List<PendingRoom> list =await _roomRepository.getRooms();
    List<PendingRoom> creationList = list.where((room)=>room.creatorId == FirebaseAuth.instance.currentUser!.uid).toList();
    print('creationList: $creationList');

   return creationList;
  }
}
