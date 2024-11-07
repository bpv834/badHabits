import 'package:bhgh/core/router/router.dart';
import 'package:bhgh/presentation/room_board_page/room_board_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/model/room.dart';

class AddCommentContainer extends StatefulWidget {
  const AddCommentContainer({super.key, required this.room});

  final Room room;

  @override
  State<AddCommentContainer> createState() => _AddCommentContainerState();
}

class _AddCommentContainerState extends State<AddCommentContainer> {
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
          if(state.commentState)
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
              viewModel.addComment(widget.room.roomId,
                  _commentTextEditingController.text);
              _commentTextEditingController.clear();
              FocusScope.of(context).unfocus();
            },
          ),
        ],
      ),
    );
  }
}
