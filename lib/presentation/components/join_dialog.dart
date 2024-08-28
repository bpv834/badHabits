import 'package:flutter/material.dart';

void joinConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('참가하시겠습니까?'),
        actions: [
          TextButton(
            onPressed: () {
              // "네" 버튼이 눌렸을 때의 동작
              Navigator.of(context).pop(); // 다이얼로그 닫기
              // 추가적인 동작을 여기에 추가할 수 있습니다.
              print('참가하기로 선택했습니다.');
            },
            child: Text('네'),
          ),
          TextButton(
            onPressed: () {
              // "아니요" 버튼이 눌렸을 때의 동작
              Navigator.of(context).pop(); // 다이얼로그 닫기
              print('참가하지 않기로 선택했습니다.');
            },
            child: Text('아니요'),
          ),
        ],
      );
    },
  );
}