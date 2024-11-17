import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/model/comment.dart';
import '../../../domain/model/room.dart';
import '../room_board_view_model.dart';
class CommentTile extends StatefulWidget {
  final Comment comment;
  final Room room;

  const CommentTile({super.key, required this.comment, required this.room});

  @override
  _CommentTileState createState() => _CommentTileState();
}

class _CommentTileState extends State<CommentTile> {
  bool _isReplyExpanded = false; // 답글을 확장할지 여부
  final TextEditingController _replyTextEditingController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RoomBoardViewModel>(); // 올바른 타입 지정
    final comment = widget.comment;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        // 댓글 타일
        Padding(
          padding: const EdgeInsets.all(2),
          child: Stack(
            children: [
              ListTile(
                contentPadding: const EdgeInsets.all(0.0), // 메뉴 버튼과의 간격 조정
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Text(
                    comment.userId == viewModel.getUserId() ? '본인' : '익명',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                subtitle: Text(comment.content),
                onTap: () {
                  setState(() {
                    _isReplyExpanded = !_isReplyExpanded; // 클릭 시 답글 확장/축소
                  });
                },
              ),
              //메뉴 박스
              Positioned(
                top: 8,
                right: 2,
                // 만약 부모 위젯이 터치 이벤트를 처리하는 로직을 가지고 있더라도,
                // 그 자식 위젯이 IgnorePointer로 감싸져 있으면, 부모 위젯은 해당 이벤트를 수신할 수 없습니다.
                //자식 위젯의 사용자 입력(터치 이벤트)을 무시하도록 설정하는 데 사용됩니다.
                // IgnorePointer 위젯의 ignoring 속성을 true로 설정하면, 그 위젯 아래에 있는 자식 위젯에 대한 터치 이벤트가 무시됩니다. 반대로 false로 설정하면, 터치 이벤트가 정상적으로 전달됩니다.
                child: IgnorePointer(
                  ignoring: false,
                  child: comment.userId == viewModel.getUserId()
                      ? PopupMenuButton<String>(
                    itemBuilder: (BuildContext context) => [
                      const PopupMenuItem<String>(
                        value: 'delete',
                        child: Text('댓글 삭제'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'edit',
                        child: Text('댓글 수정'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'reply',
                        child: Text('답글 달기'),
                      ),
                    ],
                    onSelected: (value) {
                      if (value == 'delete') {
                        viewModel.deleteComment(
                            widget.comment.commentId, widget.room.roomId);
                      } else if (value == 'edit') {
                        // 댓글 수정 로직
                        viewModel.transCommentFixState(comment);
                      } else if (value == 'reply') {
                        viewModel.transReplyState(comment);
                        // 답글 달기 로직
                      }
                    },
                    //메뉴버튼
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.red[300],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Icon(Icons.more_vert, size: 20.0),
                    ),
                  )
                  // 댓글이 내가 쓴 글이 아닌 경우
                      : PopupMenuButton<String>(
                    itemBuilder: (BuildContext context) => [
                      const PopupMenuItem<String>(
                        value: 'reply',
                        child: Text('답글 달기'),
                      ),
                    ],
                    onSelected: (value) {
                      if (value == 'reply') {
                        //방 내부의 상태를 답글달기 상태로 변경 -> 입력 컨테이너 변경
                        viewModel.transReplyState(comment);
                      }
                    },
                    //메뉴버튼
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.red[300],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Icon(Icons.more_vert, size: 20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // 답글이 확장된 경우만 답글 목록 보여줌
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: _isReplyExpanded ? 200 : 0, // 확장된 경우의 높이 조절
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 답글이 없을 때 '답글이 없습니다' 메시지
                if (comment.replies.isEmpty)
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child:
                    Text('답글이 없습니다.', style: TextStyle(color: Colors.grey)),
                  )
                else
                  ...comment.replies.map((reply) {
                    return ListTile(
                      title: Text(
                          reply.userId == viewModel.getUserId() ? '본인' : '익명'),
                      subtitle: Text(reply.content),
                      leading: Icon(Icons.reply),
                    );
                  }),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ],
    );
  }
}