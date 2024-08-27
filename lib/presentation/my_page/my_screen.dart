import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});

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
      body: Center(child: Text('My Page Content')),
    );
  }
}
