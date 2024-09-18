import 'package:bhgh/domain/model/comment.dart';
import 'package:bhgh/domain/model/reply.dart';

abstract interface class CommentRepository{
  Future<List<Comment>> getComments(String roomId);

}