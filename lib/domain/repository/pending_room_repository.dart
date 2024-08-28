import 'package:bhgh/domain/model/pending_room.dart';

abstract interface class PendingRoomRepository{
  Future<List<PendingRoom>> getRooms();
}