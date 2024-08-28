import 'package:bhgh/domain/model/pending_room.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/pending_room_repository.dart';

@Singleton(as: PendingRoomRepository)
class PendingRoomRepositoryImpl implements PendingRoomRepository {
  @override
  Future<List<PendingRoom>> getRooms() async{
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    QuerySnapshot<Map<String, dynamic>> _snapshot = await _firestore.collection("pendingRooms").get();
    List<PendingRoom> result =
    _snapshot.docs.map((e) {
      Map<String, dynamic> data = e.data();
      // creationDate를 문자열로 변환하여 data에 다시 저장
      if (data['creationDate'] is Timestamp) {
        data['creationDate'] = (data['creationDate'] as Timestamp).toDate().toIso8601String();
      }
      print('After modification: $data');
      return PendingRoom.fromJson(data);
    }).toList();
    print('PendingRoomRepositoryImpl에서 Result :$result');
    return result;
  }


}
