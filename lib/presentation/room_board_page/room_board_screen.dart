import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // DateFormat를 위해 추가
import '../../domain/model/room.dart';

class RoomBoardScreen extends StatefulWidget {
  final Room room;

  const RoomBoardScreen({super.key, required this.room});

  @override
  State<RoomBoardScreen> createState() => _RoomBoardScreenState();
}

class _RoomBoardScreenState extends State<RoomBoardScreen> {
  late Map<String, List<bool>> mutableProgress;

  @override
  void initState() {
    super.initState();
    // null 처리: room.progress가 null일 경우 빈 맵으로 초기화
    mutableProgress = Map<String, List<bool>>.from(widget.room.progress ?? {});
  }

  @override
  Widget build(BuildContext context) {
    final room = widget.room;
    final List<String> members = room.members;
    final startDate = room.startDate ?? DateTime.now();
    final duration = room.duration;

    // 날짜 기준 Column 생성 (7일 고정)
    List<DateTime> generateDates(int numberOfWeeks) {
      return List.generate(
          numberOfWeeks * 7, (index) => startDate.add(Duration(days: index)));
    }

    // 몇 주인지 구하는 메서드
    final numberOfWeeks = duration == '1주'
        ? 1
        : duration == '2주'
            ? 2
            : duration == '3주'
                ? 3
                : 4; // 기본값

    final dates = generateDates(numberOfWeeks);

    // 주 단위로 나누기 ex)4주를 1주 4개로 나누는
    List<List<DateTime>> splitIntoWeeks(List<DateTime> dates) {
      final weeks = <List<DateTime>>[];
      for (var i = 0; i < dates.length; i += 7) {
        //4주 기준 0~(7-1) (sublist)로 자르고 7~(14-1)까지 자르고 i+7이 dates.(length)보다 크면 마지막. 따라서 마지막idx-1까지 잘라 리스트를 weeks에 더함
        weeks.add(dates.sublist(i, i + 7 > dates.length ? dates.length : i + 7));
      }
      return weeks;
    }

    final weeks = splitIntoWeeks(dates);

    //yyyy-mm-yy 를 yy.mm.dd로 포맷
    String formatDate(DateTime date) {
      final DateFormat formatter = DateFormat('yy.MM.dd');
      return formatter.format(date);
    }

    // 진척도 행을 생성
    List<DataRow> generateDataRows(List<DateTime> weekDates) {
      final rows = <DataRow>[];

      for (var member in members) {
        // memberProgress도 null일 경우 빈 리스트로 처리
        final memberProgress =
            mutableProgress[member] ?? List.filled(28, false);
        final startIndex = dates.indexOf(weekDates.first);
        final endIndex = startIndex + weekDates.length;

        final weekProgress = memberProgress.sublist(
            startIndex,
            endIndex > memberProgress.length
                ? memberProgress.length
                : endIndex);
        rows.add(DataRow(
          cells: [
            DataCell(
              Text(
                '익명', // 멤버 이름 대신 익명 사용
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ...List.generate(weekDates.length, (index) {
              if (index < weekProgress.length) {
                final isComplete = weekProgress[index];
                return DataCell(
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        // mutableProgress[member]가 null일 경우, List.filled(28, false)로 초기화
                        if (mutableProgress[member] == null) {
                          mutableProgress[member] = List.filled(28, false);
                        }

                        // 인덱스에 해당하는 값을 반전 (완료/미완료 전환)
                        mutableProgress[member]![startIndex + index] =
                            !mutableProgress[member]![startIndex + index];
                      });
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
                        style: TextStyle(
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

    return Scaffold(
      appBar: AppBar(
        title: Text(room.roomName),
        backgroundColor: Colors.teal,
      ),
      body: GestureDetector(
        onTap: (){
          //화면을 눌러 키보드를 숨기기 위함
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            // 방 정보 표시
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '방 설명: ${room.description}',
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '기간: ${room.duration}',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  )
                ],
              ),
            ),
            // 주 단위로 나누어진 진척도 표
            Expanded(
              flex: 4, // 진척도 부분에 많은 공간을 할당
              child: Container(
                height: 350, // 높이 400px로 설정
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      //한주 날짜들 = weekDates
                      children: weeks.map((weekDates) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(children: [
                            Divider(),
                            DataTable(
                              columnSpacing: 12.0,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.green),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              columns: [
                                DataColumn(
                                  label: Text(
                                    '멤버',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                ...List.generate(weekDates.length, (index) {
                                  final date = weekDates[index];
                                  return DataColumn(
                                    label: Text(
                                      formatDate(date),
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  );
                                }),
                              ],
                              rows: generateDataRows(weekDates),
                            ),
                          ]),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
            // 댓글 리스트
            Expanded(
              flex: 3, // 댓글 리스트에 많은 공간을 할당
              child: Container(
                color: Colors.grey[100],
                child: ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  itemCount: 10, // 실제 댓글 개수로 변경 필요
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('댓글 ${index + 1}'),
                      subtitle: Text('댓글 내용이 여기에 들어갑니다.'),
                      leading: Icon(Icons.comment),
                    );
                  },
                ),
              ),
            ),
            // 댓글 입력란을 위한 공간
            Container(
              padding: EdgeInsets.all(8.0),
              color: Colors.grey[200],
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '댓글을 입력하세요...',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      // 댓글 전송 처리
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
