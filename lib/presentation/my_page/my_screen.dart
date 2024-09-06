import 'package:bhgh/data/repository/room_repository_impl.dart';
import 'package:bhgh/data/repository/user_repository_impl.dart';
import 'package:bhgh/domain/model/user_model.dart';
import 'package:bhgh/domain/usecase/get_my_complete_rooms_use_case.dart';
import 'package:bhgh/domain/usecase/get_my_creation_rooms_use_case.dart';
import 'package:bhgh/domain/usecase/get_my_pending_rooms_use_case.dart';
import 'package:bhgh/domain/usecase/get_my_running_rooms_use_case.dart';
import 'package:bhgh/domain/usecase/get_user_asc_use_case.dart';
import 'package:bhgh/presentation/my_page/components/profile_card.dart';
import 'package:bhgh/presentation/my_page/my_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/room_card.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MyViewModel>();
    final state = viewModel.state;
    return Scaffold(
      appBar: AppBar(
        title: const Text('내 페이지'),
        leading: IconButton(
          onPressed: () {
            viewModel.getMyRooms();
            print('state : $state');
          },
          icon: Icon(Icons.back_hand),
        ),
      ),
      body: state.isLoading == true
          ? CircularProgressIndicator()
          : RefreshIndicator(
              onRefresh: () async {
                await viewModel.getMyProfile();
                await viewModel.getMyRooms();
              },
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    ProfileCard(user: state.user!),
                    Divider(
                      color: Colors.grey, // 선의 색상
                      thickness: 1, // 선의 두께
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end, // 텍스트를 오른쪽으로 정렬
                      children: [
                        Text('My Creation Rooms'),
                      ],
                    ),
                    SizedBox(height: 16), // Space between lists
                    // 내가 만든 방 목록
                    SizedBox(
                      height: 250, // Adjust height as needed
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.myCreationRooms.length,
                        itemBuilder: (BuildContext context, int index) {
                          final creationRoom = state.myCreationRooms[index];
                          return ChangeNotifierProvider(
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
                              child: RoomCard(
                                roomName: creationRoom.roomName,
                                description: creationRoom.description,
                                creationDate:
                                    creationRoom.creationDate.toString(),
                                status: creationRoom.status,
                                members: creationRoom.members.length,
                                roomStatus: 'my creation',
                                roomId: creationRoom.roomId,
                              ));
                        },
                      ),
                    ),
                    Divider(
                      color: Colors.grey, // 선의 색상
                      thickness: 1, // 선의 두께
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end, // 텍스트를 오른쪽으로 정렬
                      children: [
                        Text('My Pending Rooms'),
                      ],
                    ),
                    // 대기방 목록
                    Container(
                      height: 250, // Adjust height as needed
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.myPendingRooms.length,
                        itemBuilder: (BuildContext context, int index) {
                          final pendingRoom = state.myPendingRooms[index];
                          return RoomCard(
                            roomName: pendingRoom.roomName,
                            description: pendingRoom.description,
                            creationDate: pendingRoom.creationDate.toString(),
                            status: pendingRoom.status,
                            members: pendingRoom.members.length,
                            roomStatus: 'my pending',
                            roomId: pendingRoom.roomId,
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 16), // Space between lists
                    Divider(
                      color: Colors.grey, // 선의 색상
                      thickness: 1, // 선의 두께
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end, // 텍스트를 오른쪽으로 정렬
                      children: [
                        Text('My Running Rooms'),
                      ],
                    ),
                    // 진행중인 방 목록
                    Container(
                      height: 250, // Adjust height as needed
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.myRunningRooms.length,
                        itemBuilder: (BuildContext context, int index) {
                          final runningRoom = state.myRunningRooms[index];
                          return RoomCard(
                            roomName: runningRoom.roomName,
                            description: runningRoom.description,
                            creationDate: runningRoom.creationDate.toString(),
                            status: runningRoom.status,
                            members: runningRoom.members.length,
                            roomStatus: 'my running',
                            roomId: runningRoom.roomId,
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 16), // Space between lists
                    Divider(
                      color: Colors.grey, // 선의 색상
                      thickness: 1, // 선의 두께
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end, // 텍스트를 오른쪽으로 정렬
                      children: [
                        Text('My Complete Rooms'),
                      ],
                    ),
                    // 완료된 방 목록
                    Container(
                      height: 250, // Adjust height as needed
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.myCompleteRooms.length,
                        itemBuilder: (BuildContext context, int index) {
                          final completeRoom = state.myCreationRooms[index];
                          return RoomCard(
                            roomName: completeRoom.roomName,
                            description: completeRoom.description,
                            creationDate: completeRoom.creationDate.toString(),
                            status: completeRoom.status,
                            members: completeRoom.members.length,
                            roomStatus: 'my completed',
                            roomId: completeRoom.roomId,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
