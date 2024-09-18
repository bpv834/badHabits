import 'package:bhgh/domain/model/comment.dart';
import 'package:bhgh/domain/repository/comment_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetMyRoomBoardCommentsDateDescUseCase {
  final CommentRepository _commentRepository;

  GetMyRoomBoardCommentsDateDescUseCase({required CommentRepository commentRepository}) : _commentRepository = commentRepository;
  Future<List<Comment>> execute(String roomId) async {
    //date 기준 내림차순 정렬
    List<Comment> list =await _commentRepository.getComments(roomId);
    list.sort((a,b)=>b.timestamp!.toString().compareTo(a.timestamp.toString()));
    return list;
  }
}
