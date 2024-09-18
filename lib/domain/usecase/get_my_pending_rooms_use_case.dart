import 'package:bhgh/domain/repository/room_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../model/room.dart';

@singleton
class GetMyPendingRoomsUseCase {
  final RoomRepository _roomRepository;

  GetMyPendingRoomsUseCase({required RoomRepository roomRepository})
      : _roomRepository = roomRepository;

  Future<List<Room>> execute() async {
    List<Room> list =await _roomRepository.getRooms();
    List<Room> pendingRooms = list.where((room)=>room.members.contains( FirebaseAuth.instance.currentUser!.uid)).where((room)=>room.status == "pending").toList();

    return pendingRooms;
  }
}
