import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/model/room.dart';
import '../room_board_view_model.dart';

class FixCommentContainer extends StatefulWidget {
  const FixCommentContainer({super.key, required this.room});

  final Room room;

  @override
  State<FixCommentContainer> createState() => _FixCommentContainerState();
}

class _FixCommentContainerState extends State<FixCommentContainer> {
  final TextEditingController _commentTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RoomBoardViewModel>();
    final state = viewModel.state;
    return Container(
      padding: EdgeInsets.all(8.0),
      color: Colors.grey[200],
      child: Row(
        children: [
          if (state.commentState)
            Expanded(
              child: TextField(
                controller: _commentTextEditingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '댓글을 입력하세요...',
                ),
              ),
            ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              viewModel.addComment(
                  widget.room.roomId, _commentTextEditingController.text);
              _commentTextEditingController.clear();
              FocusScope.of(context).unfocus();
            },
          ),
        ],
      ),
    );
  }
}
