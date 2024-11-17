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
  final TextEditingController _fixTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final room = widget.room;
    final viewModel = context.watch<RoomBoardViewModel>();
    final state = viewModel.state;
    _fixTextEditingController.text = "${state.targetComment!.content}";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
            onPressed: () {
              viewModel.transCommentState();
            },
            icon: Icon(Icons.close)),
        Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.red[200], // 배경색 설정
          child: Row(
            children: [
              Flexible(
                child: TextField(
                  controller: _fixTextEditingController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '답글을 입력하세요...',
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  final fixedText = _fixTextEditingController.text.trim();

                  if (fixedText.isNotEmpty) {
                    // 수정 메서드 생성
                    viewModel.fixComment(room, state.targetComment!, fixedText);
                    _fixTextEditingController.clear();
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
