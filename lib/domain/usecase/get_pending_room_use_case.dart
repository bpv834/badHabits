import 'package:bhgh/domain/repository/pending_room_repository.dart';
import 'package:injectable/injectable.dart';

import '../model/pending_room.dart';

@singleton
class GetPendingRoomUseCase {
  final PendingRoomRepository _roomRepository;

  GetPendingRoomUseCase({required PendingRoomRepository roomRepository}) : _roomRepository = roomRepository;

  Future<List<PendingRoom>> execute() async {
    final pendingRoom = await _roomRepository.getRooms();
    print('rooms = $pendingRoom');
    return pendingRoom;
  }
}