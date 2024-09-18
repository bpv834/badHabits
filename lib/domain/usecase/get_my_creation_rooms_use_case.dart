import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../model/room.dart';
import '../repository/room_repository.dart';

@singleton
class GetMyCreationRoomsUseCase {
  final RoomRepository _roomRepository;

  GetMyCreationRoomsUseCase({required RoomRepository roomRepository})
      : _roomRepository = roomRepository;

  Future<List<Room>> execute() async {
    List<Room> list =await _roomRepository.getRooms();
    List<Room> creationList = list.where((room)=>room.creatorId == FirebaseAuth.instance.currentUser!.uid).toList();

   return creationList;
  }
}
