import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/model/comment.dart';
import '../room_board_view_model.dart';

class CommentTile extends StatefulWidget {
  final Comment comment;

  const CommentTile({super.key, required this.comment});

  @override
  _CommentTileState createState() => _CommentTileState();
}

class _CommentTileState extends State<CommentTile> {
  bool _isReplyExpanded = false; // 답글을 확장할지 여부
  final TextEditingController _replyTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<RoomBoardViewModel>();
    final comment = widget.comment;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(),
        // 댓글 타일
        Padding(
          padding: EdgeInsets.all(2),
          child: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isReplyExpanded = !_isReplyExpanded; // 클릭 시 답글 확장/축소
                  });
                },
                child: ListTile(
                  contentPadding: EdgeInsets.all(0.0), // 메뉴 버튼과의 간격 조정
                  title: Padding(
                    padding: EdgeInsets.only(bottom: 12.0),
                    child: Text(
                      comment.userId == viewModel.getUserId() ? '본인' : '익명',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  subtitle: Text(comment.content),
                ),
              ),
              Positioned(
                top: 8,
                right: 2,
                child: PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'delete') {
                      // 댓글 삭제 로직
                    } else if (value == 'edit') {
                      // 댓글 수정 로직
                    } else if (value == 'reply') {
                      // 답글 달기 로직
                    } else if (value == 'close') {
                      // 팝업 메뉴 닫기 로직

                    }
                  },
                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem<String>(
                      value: 'delete',
                      child: Text('댓글 삭제'),
                    ),
                    PopupMenuItem<String>(
                      value: 'edit',
                      child: Text('댓글 수정'),
                    ),
                    PopupMenuItem<String>(
                      value: 'reply',
                      child: Text('답글 달기'),
                    ),
                    PopupMenuItem<String>(
                      value: 'close',
                      child: Text('닫기'),
                    ),
                  ],
                  // 메뉴 버튼
                  //IgnorePointer는 사용자의 터치 및 클릭 이벤트를 무시하도록 만드는 위젯입니다. 이를 통해 해당 위젯이나 자식 위젯에 포인터 이벤트가 전달되지 않게 할 수 있습니다.
                  child: IgnorePointer(
                    ignoring: false, // (해당 위젯 이벤트는 활성화)PopupMenuButton 이벤트는 무시하지 않도록 설정
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.red[300],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Icon(Icons.more_vert, size: 20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // 답글이 확장된 경우만 답글 목록 보여줌
        AnimatedContainer(
          duration: Duration(milliseconds: 200),
          height: _isReplyExpanded ? 200 : 0, // 확장된 경우의 높이 조절
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 답글이 없을 때 '답글이 없습니다' 메시지
                if (comment.replies.isEmpty)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('답글이 없습니다.', style: TextStyle(color: Colors.grey)),
                  )
                else
                  ...comment.replies.map((reply) {
                    return ListTile(
                      title: Text(
                          reply.userId == viewModel.getUserId() ? '본인' : '익명'),
                      subtitle: Text(reply.content),
                      leading: Icon(Icons.reply),
                    );
                  }).toList(),
                SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
