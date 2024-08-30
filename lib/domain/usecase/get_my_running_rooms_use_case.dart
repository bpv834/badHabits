import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../model/room.dart';
import '../repository/room_repository.dart';

@singleton
class GetMyRunningRoomsUseCase {
  final RoomRepository _roomRepository;

  GetMyRunningRoomsUseCase({required RoomRepository roomRepository})
      : _roomRepository = roomRepository;

  Future<List<Room>> execute() async {
    List<Room> list =await _roomRepository.getRooms();
    List<Room> runningRooms = list.where((room)=>room.members.contains( FirebaseAuth.instance.currentUser!.uid)).where((room)=>room.status == "running").toList();
    print('runningRooms: $runningRooms');
    return runningRooms;
  }
}
