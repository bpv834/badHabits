
import 'package:bhgh/domain/model/reply.dart';
import 'package:bhgh/domain/repository/reply_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetRepliesDescUseCase {
  final ReplyRepository _replyRepository;

  GetRepliesDescUseCase({required ReplyRepository replyRepository}) : _replyRepository = replyRepository;

  Future<List<Reply>> execute(String commentId) async {
    // Replies 가져오기
    List<Reply> replies = await _replyRepository.getReplies(commentId);

    // 최근순으로 정렬
    replies.sort((a, b) => b.timestamp!.compareTo(a.timestamp!));

    // 정렬된 리스트 반환
    return replies;
  }
}
