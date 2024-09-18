import 'package:bhgh/data/repository/comment_repository_impl.dart';
import 'package:bhgh/domain/usecase/get_room_board_comments_date_desc_use_case.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/model/comment.dart';
import '../../../domain/model/room.dart';
import '../room_board_view_model.dart';
import 'comment_tile.dart';

class CommentsFutureBuilder extends StatelessWidget {
  final Room room;

  const CommentsFutureBuilder({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RoomBoardViewModel>();

    return Expanded(
      flex: 3,
      child: FutureBuilder<List<Comment>>(
        future: viewModel.getCommentsByRoomId(room.roomId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('댓글을 불러오는 중 오류가 발생했습니다.'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('댓글이 없습니다.'));
          }

          final comments = snapshot.data!;
          return ListView.builder(
            padding: EdgeInsets.all(8.0),
            itemCount: comments.length,
            itemBuilder: (context, index) {
              final comment = comments[index];
              return ChangeNotifierProvider(
                  create: (_) => RoomBoardViewModel(
                      getMyRoomBoardCommentsDateAscUseCase:
                          GetMyRoomBoardCommentsDateDescUseCase(
                              commentRepository: CommentRepositoryImpl())),
                  child: CommentTile(comment: comment));
            },
          );
        },
      ),
    );
  }
}
