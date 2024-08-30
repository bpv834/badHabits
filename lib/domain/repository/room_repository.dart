import 'package:bhgh/domain/model/room.dart';

abstract interface class RoomRepository{
  Future<List<Room>> getRooms();
}