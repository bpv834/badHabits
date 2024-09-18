import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../model/room.dart';
import '../repository/room_repository.dart';

@singleton
class GetMyCompleteRoomsUseCase {
  final RoomRepository _roomRepository;

  GetMyCompleteRoomsUseCase({required RoomRepository roomRepository})
      : _roomRepository = roomRepository;

  Future<List<Room>> execute() async {
    List<Room> list =await _roomRepository.getRooms();
    List<Room> completeRooms = list.where((room)=>room.members.contains( FirebaseAuth.instance.currentUser!.uid)).where((room)=>room.status == "complete").toList();
    return completeRooms;
  }
}
