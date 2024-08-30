import 'package:flutter/material.dart';

class RoomCard extends StatelessWidget {
  final String roomName;
  final String description;
  final String creationDate;
  final String status;
  final int members;

  const RoomCard(
      {super.key,
      required this.roomName,
      required this.description,
      required this.creationDate,
      required this.status,
      required this.members});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      elevation: 4,
      child: Container(
        width: 200, // Adjust width as needed
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Room Name : $roomName',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('description: $description', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('status: ${status}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('members: ${members}', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
