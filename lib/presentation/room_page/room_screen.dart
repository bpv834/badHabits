import 'package:bhgh/presentation/components/pending_room_tile.dart';
import 'package:bhgh/presentation/room_page/room_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoomScreen extends StatelessWidget {
  const RoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RoomViewModel>();
    final state = viewModel.state;
    return Scaffold(
      appBar: AppBar(
        title: const Text('RoomList'),
        actions: [
          IconButton(onPressed: (){
            viewModel.showCreateGroupDialog(context);
          }, icon: Icon(Icons.edit))
        ],
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: state.rooms.length,
              itemBuilder: (BuildContext context, int idx) {
                return PendingRoomTile(
                  creationDate: state.rooms[idx].creationDate.toString(),
                  creatorId: state.rooms[idx].creatorId,
                  description: state.rooms[idx].description,
                  duration: state.rooms[idx].duration,
                  members: state.rooms[idx].members,
                  roomName: state.rooms[idx].roomName,
                );
              }),
    );
  }
}
