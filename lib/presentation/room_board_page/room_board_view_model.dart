import 'package:bhgh/domain/model/comment.dart';
import 'package:bhgh/domain/usecase/get_room_board_comments_date_desc_use_case.dart';
import 'package:bhgh/presentation/room_board_page/room_board_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../../domain/model/room.dart';

@injectable
class RoomBoardViewModel with ChangeNotifier {
  final GetMyRoomBoardCommentsDateDescUseCase _getMyRoomBoardCommentsDateAscUseCase;

  RoomBoardState _state = const RoomBoardState();

  RoomBoardViewModel(
      {required GetMyRoomBoardCommentsDateDescUseCase getMyRoomBoardCommentsDateAscUseCase})
      : _getMyRoomBoardCommentsDateAscUseCase = getMyRoomBoardCommentsDateAscUseCase {}

  RoomBoardState get state => _state;


  // 날짜 기준 Column 생성 (7일 고정)
  //startDate.add(Duration(days: i))는 주어진 날짜 startDate에 특정한 기간(Duration)을 더해 새로운 DateTime 객체를 반환하는 메서드
  List<DateTime> generateDates(int numberOfWeeks, DateTime startDate) {
    return List.generate(
        numberOfWeeks * 7, (index) => startDate.add(Duration(days: index)));
  }

  int getNumberOfWeeks(String duration) {
    int weeksCount = 0;

    weeksCount = duration == '1주'
        ? 1
        : duration == '2주'
        ? 2
        : duration == '3주'
        ? 3
        : 4; // 기본값

    return weeksCount;
  }

  // 주 단위로 나누기 ex)4주를 1주 4개로 나누는
  List<List<DateTime>> splitIntoWeeks(List<DateTime> dates) {
    final weeks = <List<DateTime>>[];
    for (var i = 0; i < dates.length; i += 7) {
      //4주 기준 0~(7-1) (sublist)로 자르고 7~(14-1)까지 자르고 i+7이 dates.(length)보다 크면 마지막. 따라서 마지막idx-1까지 잘라 리스트를 weeks에 더함
      weeks.add(dates.sublist(i, i + 7 > dates.length ? dates.length : i + 7));
    }
    return weeks;
  }

  //yyyy-mm-yy 를 yy.mm.dd로 포맷
  String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('yy.MM.dd');
    return formatter.format(date);
  }

  //user uid리턴 메서드
  String getUserId() {
    String userId;
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userId = user.uid;
    } else {
      userId = "";
      print("Error : user == null");
    }
    return userId;
  }

  Future<void> postProgressToFireBase(Map<String, List<bool>> progress,
      Room room) async {
    final FirebaseFirestore db = FirebaseFirestore.instance;

    final roomRef = db.collection('rooms').doc(room.roomId);
    await roomRef.update({'progress': progress});
  }

  // 진척도 업데이트 메서드 (progress update function)
  Future<void> updateProgress(Room room, String member, int index,
      DateTime date) async {
    if (member == getUserId()) {
      DateTime now = DateTime.now().toLocal();

      // 받은 date의 시작일과 그 다음일 시작일을 계산
      DateTime startOfDate = DateTime(date.year, date.month, date.day);
      DateTime startOfNextDate = startOfDate.add(Duration(days: 1));

      // 날짜가 해당 날짜 또는 그 다음 날인 경우만 업데이트 허용
      if (now.isBefore(startOfDate) || now.isAfter(startOfNextDate)) {
        print("Error: 해당 날짜 또는 그 다음 날만 업데이트할 수 있습니다.");
        return; // 업데이트를 진행하지 않음
      }

      _state = _state.copyWith(isLoading: true);
      notifyListeners();

      final updatedProgress =
      Map<String, List<bool>>.from(_state.mutableProgress);

      if (updatedProgress[member] == null) {
        updatedProgress[member] = List.filled(28, false);
      }

      // 특정 인덱스의 진척도 값을 토글합니다.
      updatedProgress[member]![index] = !updatedProgress[member]![index];

      // 상태를 업데이트합니다.
      _state =
          _state.copyWith(isLoading: false, mutableProgress: updatedProgress);
      print(_state.mutableProgress);

      // UI를 새로고침하도록 알립니다.
      notifyListeners();
      await postProgressToFireBase(updatedProgress, room);
    }
  }

// 진척도 행을 생성
  List<DataRow> generateDataRows(List<DateTime> weekDates, Room room,
      List<DateTime> dates) {
    List<String> members = room.members;
    _state = _state.copyWith(
        mutableProgress: Map<String, List<bool>>.from(room.progress ?? {}));
    final rows = <DataRow>[];

    for (var member in members) {
      int idx = 1;
      // memberProgress가 null일 경우 빈 리스트로 처리
      final memberProgress =
          _state.mutableProgress[member] ?? List.filled(28, false);
      final startIndex = dates.indexOf(weekDates.first);
      final endIndex = startIndex + weekDates.length;

      List<bool> weekProgress = memberProgress.sublist(
        startIndex,
        endIndex > memberProgress.length ? memberProgress.length : endIndex,
      );

      rows.add(DataRow(
        cells: [
          DataCell(
            Text(
              member == getUserId() ? '본인' : '익명${idx++}', // 멤버 이름 대신 익명 사용
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ...List.generate(weekDates.length, (index) {
            if (index < weekProgress.length) {
              bool isComplete = weekProgress[index];
              return DataCell(
                GestureDetector(
                  onTap: () {
                    if (startIndex + index < memberProgress.length &&
                        startIndex + index < dates.length) {
                      updateProgress(room, member, startIndex + index,
                          weekDates[index]); // weekDates 범위를 초과하지 않도록 수정
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isComplete ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.black12),
                    ),
                    width: 60,
                    height: 40,
                    alignment: Alignment.center,
                    child: Text(
                      isComplete ? '완료' : '미완료',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return DataCell(Container()); // 빈 셀
            }
          }),
        ],
      ));
    }
    return rows;
  }

  Future<void> addComment(String roomId, String commentContent) async {
    try {
      String userId = getUserId();

      // Firestore 인스턴스 참조
      final _firestore = FirebaseFirestore.instance;

      // comments 컬렉션의 참조
      final commentsCollection = _firestore.collection('comments');

      // 새로운 댓글 문서 생성
      final newCommentDoc = commentsCollection.doc(); // 자동 생성된 댓글 문서 ID

      // 댓글 데이터
      final commentData = {
        'commentId': newCommentDoc.id,
        'userId': userId,
        'roomId': roomId,
        'content': commentContent,
        'timestamp': DateTime.now(),
        'replies': [], // 초기에는 빈 답글 리스트
      };

      // 댓글을 Firestore에 저장
      await newCommentDoc.set(commentData);
      //새로 쓴 댓글을 불러와 화면을 다시 그린다.
      getCommentsByRoom(roomId);
    } catch (e) {
      print("Error adding comment: $e");
    }
  }

  // 댓글 삭제
  Future<void> deleteComment(String commentId, String roomId) async {
    try {
      _state = _state.copyWith(isReplyLoading: true);
      notifyListeners();

      // Firestore 인스턴스 초기화
      final FirebaseFirestore _firestore = FirebaseFirestore.instance;

      // 댓글 ID에 해당하는 댓글을 Firestore에서 삭제
      await _firestore.collection('comments').doc(commentId).delete();

      //댓글 삭제 후 상태변경
      getCommentsByRoom(roomId);
      // 성공적으로 삭제된 경우 추가 로직 (예: UI 업데이트 등)
      print('Comment deleted successfully');
    } catch (e) {
      // 에러 발생 시 처리 로직
      print('Failed to delete comment: $e');
    }
  }
  //댓글 수정

  //답글 달기


  Future<void> addReply(String commentId, String replyContent) async {
    try {
      String userId = getUserId();
      final FirebaseFirestore _firestore = FirebaseFirestore.instance;

      // 답글 데이터
      final replyData = {
        'replyId': '', // 자동 생성된 답글 ID로 설정할 예정
        'userId': userId,
        'content': replyContent,
        'timestamp': DateTime.now(),
      };

      // 댓글 문서의 replies 서브 컬렉션 참조
      final commentDoc = _firestore.collection('comments').doc(commentId);

      // 새로운 답글 문서 생성
      final newReplyDoc =
      commentDoc.collection('replies').doc(); // 자동 생성된 답글 문서 ID

      // 답글 데이터를 Firestore에 저장
      await newReplyDoc.set({
        ...replyData,
        'replyId': newReplyDoc.id, // 자동 생성된 답글 ID 설정
      });

      // UI 갱신
      notifyListeners();
    } catch (e) {
      print('Error adding reply: $e');
      throw e;
    }
  }

  Future<void> getCommentsByRoom(String roomId) async {
    _state = _state.copyWith(isReplyLoading: true);
    notifyListeners();

    List<Comment> commentsList = await _getMyRoomBoardCommentsDateAscUseCase
        .execute(roomId);
    _state = _state.copyWith(comments: commentsList, isReplyLoading: false);
    notifyListeners();
  }


}
