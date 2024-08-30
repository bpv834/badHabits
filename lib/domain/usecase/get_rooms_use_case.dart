import 'package:injectable/injectable.dart';

import '../model/room.dart';
import '../repository/room_repository.dart';

@singleton
class GetRoomsUseCase {
  final RoomRepository _roomRepository;

  GetRoomsUseCase({required RoomRepository roomRepository}) : _roomRepository = roomRepository;

  Future<List<Room>> execute() async { // 반환 타입을 List<Room>으로 변경
    final rooms = await _roomRepository.getRooms();
    print('rooms = $rooms');
    return rooms;
  }
}
