import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('내 페이지'),
        leading: IconButton(
          onPressed: () {
            context.pop(context);
          },
          icon: Icon(Icons.back_hand),
        ),
      ),
      body: Center(child: Text('Group Page Content')),
    );
  }
}
