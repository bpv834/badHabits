import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/model/room.dart';
import '../room_board_view_model.dart';

class AddReplyContainer extends StatefulWidget {
  const AddReplyContainer({super.key, required this.room});

  final Room room;

  @override
  State<AddReplyContainer> createState() => _AddReplyContainerState();
}

class _AddReplyContainerState extends State<AddReplyContainer> {
  final TextEditingController _replyTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RoomBoardViewModel>();
    final state = viewModel.state;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(onPressed: (){
          viewModel.transCommentState();
        }, icon: Icon(Icons.close)),
        Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.red[200], // 배경색 설정
          child: Row(
            children: [
              Flexible(
                child: TextField(
                  controller: _replyTextEditingController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '답글을 입력하세요...',
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  final replyText = _replyTextEditingController.text.trim();

                  if (replyText.isNotEmpty) {
                    print("${state.targetCommentId}, $replyText");
                    viewModel.addReply(widget.room.roomId,state.targetCommentId, replyText);
                    _replyTextEditingController.clear();
                    FocusScope.of(context).unfocus(); // 키보드 닫기
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
