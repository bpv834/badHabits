import 'package:bhgh/core/router/router.dart';
import 'package:bhgh/data/repository/room_repository_impl.dart';
import 'package:bhgh/data/repository/user_repository_impl.dart';
import 'package:bhgh/domain/usecase/get_my_complete_rooms_use_case.dart';
import 'package:bhgh/domain/usecase/get_my_creation_rooms_use_case.dart';
import 'package:bhgh/domain/usecase/get_my_pending_rooms_use_case.dart';
import 'package:bhgh/domain/usecase/get_my_running_rooms_use_case.dart';
import 'package:bhgh/domain/usecase/get_user_asc_use_case.dart';
import 'package:bhgh/presentation/my_page/components/start_button.dart';
import 'package:bhgh/presentation/my_page/my_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/model/room.dart';

class RoomCard extends StatefulWidget {
  final Room room;
  final String roomStatus;
  final int? leftDay;

  const RoomCard({
    super.key,
    required this.roomStatus,
    required this.leftDay,
    required this.room,
  });

  @override
  State<RoomCard> createState() => _RoomCardState();
}

class _RoomCardState extends State<RoomCard> {
  @override
  void initState() {
    if(widget.leftDay == -2){
      //2일이 지나면 저절로 convertingToComplete 메서드를 통해 방 상태를 running-> complete 로 변경
      final viewModel = context.read<MyViewModel>();
      viewModel.convertingToComplete(widget.room.roomId);
    }
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        router.push('/roomBoardPage',extra: widget.room); // extra 이용해서 인스턴스 넘겨줌
      },
      child: SingleChildScrollView(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          elevation: 4,
          child: Container(
            width: 200,
            height: 200, // Adjust width as needed
            padding: const EdgeInsets.all(16),
            child: Stack(
              children: <Widget>[
                // 메인 컨텐츠
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.room.roomName,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(widget.room.description, style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 8),
                    Text('status: ${widget.room.status}',
                        style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 8),
                    Text('members: ${widget.room.members.length}',
                        style: const TextStyle(fontSize: 16)),
                    widget.room.status == 'running' && widget.leftDay != null
                        ? Text('남은일수 : ${widget.leftDay}',
                            style: const TextStyle(fontSize: 16))
                        : SizedBox()
                  ],
                ),
                // 삼항 연산자로 버튼 혹은 빈 박스 추가
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: widget.roomStatus == 'my creation'
                      ? ChangeNotifierProvider(
                          create: (_) => MyViewModel(
                              GetMyCreationRoomsUseCase(
                                  roomRepository: RoomRepositoryImpl()),
                              GetMyPendingRoomsUseCase(
                                  roomRepository: RoomRepositoryImpl()),
                              GetMyRunningRoomsUseCase(
                                  roomRepository: RoomRepositoryImpl()),
                              GetMyCompleteRoomsUseCase(
                                  roomRepository: RoomRepositoryImpl()),
                              GetUserAscUseCase(UserRepositoryImpl())),
                          child: widget.room.status == 'pending'
                              ? StartButton(
                                  roomId: widget.room.roomId,
                                )
                              : SizedBox())
                      : const SizedBox(), // 'running'일 때는 빈 박스를 표시
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
