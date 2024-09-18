import 'package:flutter/material.dart';

import '../../../domain/model/room.dart';

class RoomInformColumn extends StatelessWidget {
  RoomInformColumn({super.key, required this.room});
  final Room room;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '방 설명: ${room.description}',
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              Text(
                '기간: ${room.duration}',
                style: TextStyle(fontSize: 14),
              ),
            ],
          )
        ],
      ),
    );
  }
}
