import 'package:bhgh/domain/model/reply.dart';

abstract interface class ReplyRepository{
  Future<List<Reply>> getReplies(String commentId);

}