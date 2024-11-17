import 'package:bhgh/domain/model/comment.dart';
import 'package:bhgh/domain/model/reply.dart';
import 'package:bhgh/domain/repository/reply_repository.dart';
import 'package:bhgh/domain/usecase/get_replies_desc_use_case.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/comment_repository.dart';

@Singleton(as: CommentRepository)
class CommentRepositoryImpl implements CommentRepository {

  Future<List<Comment>> getComments(String roomId) async {
    try {
      final FirebaseFirestore _firestore = FirebaseFirestore.instance;

      // 'comments' 컬렉션에서 roomId가 일치하는 댓글 목록을 가져옵니다.
      QuerySnapshot _snapshot = await _firestore
          .collection('comments')
          .where('roomId', isEqualTo: roomId) // roomId 조건으로 필터링
          .get();

      // QuerySnapshot을 Comment 모델로 변환하여 리스트로 반환
      List<Comment> comments = _snapshot.docs.map((e) {
        Map<String, dynamic> data = e.data() as Map<String, dynamic>;

        // Firestore의 Timestamp 타입을 DateTime 형식으로 변환
        if (data['timestamp'] is Timestamp) {
          data['timestamp'] =
              (data['timestamp'] as Timestamp).toDate().toIso8601String();
        }

        // Comment 모델로 변환
        return Comment.fromJson(data);
      }).toList();

      return comments; // 댓글 리스트 반환
    } catch (e) {
      print('Error fetching comments: $e');
      throw Exception('Failed to load comments');
    }
  }
}
