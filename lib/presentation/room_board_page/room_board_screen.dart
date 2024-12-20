import 'package:bhgh/data/repository/comment_repository_impl.dart';
import 'package:bhgh/domain/usecase/get_room_board_comments_date_desc_use_case.dart';
import 'package:bhgh/presentation/room_board_page/components/add_comment_container.dart';
import 'package:bhgh/presentation/room_board_page/components/add_reply_container.dart';
import 'package:bhgh/presentation/room_board_page/components/data_table_container.dart';
import 'package:bhgh/presentation/room_board_page/components/fix_comment_container.dart';
import 'package:bhgh/presentation/room_board_page/components/room_inform_column.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/model/room.dart';
import '../../presentation/room_board_page/room_board_view_model.dart';
import 'components/comment_tile.dart';

class RoomBoardScreen extends StatefulWidget {
  final Room room;

  const RoomBoardScreen({super.key, required this.room});

  @override
  State<RoomBoardScreen> createState() => _RoomBoardScreenState();
}

class _RoomBoardScreenState extends State<RoomBoardScreen> {
  @override
  void initState() {
    super.initState();
    // ViewModel에서 필요한 초기화를 진행
    //  UI 프레임이 빌드된 후에 특정 작업을 수행하기 위해 사용되는 메서드입니다. 이 메서드는 주로 UI가 화면에 표시된 후 실행되어야 하는 로직을 추가할 때 유용합니다.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = context.read<RoomBoardViewModel>();
      viewModel.getCommentsByRoom(widget.room.roomId);
    });
  }
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RoomBoardViewModel>();
    final state = viewModel.state;
    final room = widget.room;

    return Scaffold(
      appBar: AppBar(
        title: Text(room.roomName),
        backgroundColor: Colors.teal,
      ),
      body: state.isLoading
          ? Center(child: CircularProgressIndicator())
          : GestureDetector(
              onTap: () {
                // 화면을 눌러 키보드를 숨기기 위함
                FocusScope.of(context).unfocus();
              },
              child: Column(
                children: [
                  // 방 정보 표시
                  RoomInformColumn(room: room),
                  // 주 단위로 나누어진 진척도 표
                  DataTableContainer(room: room),
                  // 댓글목록 view
                  Expanded(
                    child: state.isCommentLoading
                        ? CircularProgressIndicator()
                        : ListView.builder(
                            padding: EdgeInsets.all(8.0),
                            itemCount: state.comments.length,
                            itemBuilder: (context, index) {
                              final comment = state.comments[index];
                              return CommentTile(comment: comment, room: room);
                            },
                          ),
                  ),
                  // 댓글 입력란을 위한 공간
                if(state.replyState) AddReplyContainer(room: room)
                  else if(state.commentFixState) FixCommentContainer(room: room)
                  else AddCommentContainer(room: room)
                ],
              ),
            ),
    );
  }
}
