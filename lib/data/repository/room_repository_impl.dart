import 'package:bhgh/domain/model/room.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/room_repository.dart';

@Singleton(as: RoomRepository)
class RoomRepositoryImpl implements RoomRepository {
  @override
  Future<List<Room>> getRooms() async{
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    QuerySnapshot<Map<String, dynamic>> _snapshot = await _firestore.collection("rooms").get();




    List<Room> result =
    _snapshot.docs.map((e) {
      Map<String, dynamic> data = e.data();

      print('data: $data');
      // creationDate를 문자열로 변환하여 data에 다시 저장
      if (data['creationDate'] is Timestamp) {
        data['creationDate'] = (data['creationDate'] as Timestamp).toDate().toIso8601String();
      }
      if (data['startDate'] is Timestamp) {
        data['startDate'] = (data['startDate'] as Timestamp).toDate().toIso8601String();
      }
      if (data['targetDate'] is Timestamp) {
        data['targetDate'] = (data['targetDate'] as Timestamp).toDate().toIso8601String();
      }
      return Room.fromJson(data);
    }).toList();
    return result;
  }
}
