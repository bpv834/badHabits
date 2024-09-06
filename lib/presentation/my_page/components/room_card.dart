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

class RoomCard extends StatelessWidget {
  final String roomId;
  final String roomName;
  final String description;
  final String creationDate;
  final String status;
  final int members;
  final String roomStatus;

  const RoomCard({
    super.key,
    required this.roomName,
    required this.description,
    required this.creationDate,
    required this.status,
    required this.members,
    required this.roomStatus,
    required this.roomId,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MyViewModel>();
    return SingleChildScrollView(
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        elevation: 4,
        child: Container(
          width: 200, // Adjust width as needed
          padding: const EdgeInsets.all(16),
          child: Stack(
            children: <Widget>[
              // 메인 컨텐츠
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    roomName,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(description, style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 8),
                  Text('status: $status', style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 8),
                  Text('members: $members',
                      style: const TextStyle(fontSize: 16)),
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
                        child: const StartButton(),
                      )
                    : const SizedBox(), // 빈 박스
              ),
            ],
          ),
        ),
      ),
    );
  }
}
