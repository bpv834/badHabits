import 'package:bhgh/core/router/router.dart';
import 'package:bhgh/presentation/my_page/my_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MyViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('내 페이지'),
        leading: IconButton(
          onPressed: () {
            viewModel.getMyRooms();
          },
          icon: Icon(Icons.back_hand),
        ),
      ),
      body: Center(child: Text('My Page Content')),
    );
  }
}
