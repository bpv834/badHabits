import 'package:bhgh/domain/model/reply.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/reply_repository.dart';

@Singleton(as: ReplyRepository)
class ReplyRepositoryImpl implements ReplyRepository{
  @override
  Future<List<Reply>> getReplies(String commentId) async {
    try {
      final FirebaseFirestore _firestore = FirebaseFirestore.instance;

      // 'comments' 컬렉션의 특정 commentId에 있는 'replies' 서브컬렉션 가져오기
      QuerySnapshot _snapshot = await _firestore
          .collection('comments')
          .doc(commentId)
          .collection('replies')
          .get();

      // QuerySnapshot을 Reply 모델로 변환하여 리스트로 반환
      List<Reply> replies = _snapshot.docs.map((e) {
        Map<String, dynamic> data = e.data() as Map<String, dynamic>;

        // Firestore의 Timestamp 타입을 DateTime 형식으로 변환
        if (data['timestamp'] is Timestamp) {
          data['timestamp'] =
              (data['timestamp'] as Timestamp).toDate().toIso8601String(); // TimeStamp type -> DateTime type으로 형변환
        }

        // Reply 모델로 변환
        return Reply.fromJson(data);
      }).toList();

      return replies; // Reply 리스트 반환
    } catch (e) {
      print('Error fetching replies: $e');
      throw Exception('Failed to load replies');
    }
  }
}