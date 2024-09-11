import 'package:bhgh/presentation/room_page/room_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateRoomDialog extends StatefulWidget {
  @override
  _CreateRoomDialogState createState() => _CreateRoomDialogState();
}

class _CreateRoomDialogState extends State<CreateRoomDialog> {
  final _roomNameController = TextEditingController();
  final _habitController = TextEditingController();
  final _descriptionController = TextEditingController();
  String? _selectedDuration;
  final List<String> _durations = ['1주', '2주', '3주', '4주'];

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RoomViewModel>();
    return AlertDialog(
      title: Text('Create Room'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _roomNameController,
            decoration: InputDecoration(labelText: 'Group Name'),
          ),
          TextField(
            controller: _habitController,
            decoration: InputDecoration(labelText: 'Habit to Change'),
          ),
          TextField(
            controller: _descriptionController,
            decoration: InputDecoration(labelText: 'description'),
          ),
          DropdownButton<String>(
            value: _selectedDuration,
            hint: Text('Select Duration'),
            items: _durations.map((String duration) {
              return DropdownMenuItem<String>(
                value: duration,
                child: Text(duration),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedDuration = newValue;
              });
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () async{
            // Perform group creation logic here
            print('Group Name: ${_roomNameController.text}');
            print('Habit to Change: ${_habitController.text}');
            print('Selected description: $_descriptionController');
            print('Selected Duration: $_selectedDuration');
            // Close the dialog
            viewModel.createRoom(_roomNameController.text, _habitController.text, _descriptionController.text, _selectedDuration!);
            Navigator.of(context).pop();
          },
          child: Text('Create Room'),
        ),
      ],
    );
  }
}