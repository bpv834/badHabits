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

class RoomCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        router.push('/roomBoardPage',extra: room); // extra 이용해서 인스턴스 넘겨줌
        print('@@@@@@progress${room.progress}');
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
                      room.roomName,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(room.description, style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 8),
                    Text('status: ${room.status}',
                        style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 8),
                    Text('members: ${room.members.length}',
                        style: const TextStyle(fontSize: 16)),
                    room.status == 'running' && leftDay != null
                        ? Text('남은일수 : $leftDay',
                            style: const TextStyle(fontSize: 16))
                        : SizedBox()
                  ],
                ),
                // 삼항 연산자로 버튼 혹은 빈 박스 추가
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: roomStatus == 'my creation'
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
                          child: room.status == 'pending'
                              ? StartButton(
                                  roomId: room.roomId,
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
