import 'package:bhgh/presentation/my_page/my_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartButton extends StatelessWidget {
  final String roomId;

  const StartButton({super.key, required this.roomId});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MyViewModel>();
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      '악습관 교정을 시작하시겠습니까?',
                      style: TextStyle(fontSize: 20), // 제목의 글자 크기 조절
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          onPressed: () {
                            // "네" 버튼 클릭 시 동작
                            Navigator.of(context).pop(); // 다이얼로그 닫기
                            viewModel.convertingToRunning(roomId);
                            print('악습관 교정 시작');
                          },
                          child: const Text('네'),
                        ),
                        SizedBox(width: 8),
                        TextButton(
                          onPressed: () {
                            // "아니요" 버튼 클릭 시 동작
                            Navigator.of(context).pop(); // 다이얼로그 닫기
                            print('악습관 교정 취소');
                          },
                          child: const Text('아니요'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      icon: Icon(Icons.play_arrow),
    );
  }

}
