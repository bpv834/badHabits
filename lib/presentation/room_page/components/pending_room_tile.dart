import 'package:bhgh/presentation/room_page/room_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PendingRoomTile extends StatelessWidget {
  final String creationDate;
  final String creatorId;
  final String description;
  final String duration;
  final List<String> members;
  final String roomName;
  final String roomId;

  const PendingRoomTile({
    Key? key,
    required this.creationDate,
    required this.creatorId,
    required this.description,
    required this.duration,
    required this.members,
    required this.roomName,
    required this.roomId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RoomViewModel>();
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  roomName,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text("Description: $description"),
                Text("Creator ID: $creatorId"),
                Text("Duration: $duration"),
                Text("Creation Date: $creationDate"),
                SizedBox(height: 10),
                Text(
                  "Members:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '${members.length}',
                  style: TextStyle(color: Colors.blueAccent),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: ElevatedButton(
              onPressed: () {
                // 다이얼로그를 화면에 띄우기

                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('참가하시겠습니까?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            viewModel.joinRoomAsId(roomId,context);

                            Navigator.of(context).pop(); // 다이얼로그 닫기
                            // "네" 버튼 클릭 시 추가적인 동작을 여기에 추가할 수 있습니다.
                          },
                          child: const Text('네'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // 다이얼로그 닫기
                            print('참가하지 않기로 선택했습니다.');
                          },
                          child: const Text('아니요'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('입장하기'),
            ),
          ),
        ],
      ),
    );
  }
}
