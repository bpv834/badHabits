import 'package:bhgh/presentation/components/join_dialog.dart';
import 'package:flutter/material.dart';

class PendingRoomTile extends StatelessWidget {
  final String creationDate;
  final String creatorId;
  final String description;
  final String duration;
  final List<String> members;
  final String roomName;

  const PendingRoomTile({
    Key? key,
    required this.creationDate,
    required this.creatorId,
    required this.description,
    required this.duration,
    required this.members,
    required this.roomName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        joinConfirmationDialog(context);
      },
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Padding(
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
              for (var member in members)
                Text(
                  member,
                  style: TextStyle(color: Colors.blueAccent),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
