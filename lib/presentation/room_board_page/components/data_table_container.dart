import 'package:bhgh/core/router/router.dart';
import 'package:bhgh/domain/model/room.dart';
import 'package:bhgh/presentation/room_board_page/room_board_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DataTableContainer extends StatelessWidget {
  const DataTableContainer({super.key, required this.room});

  final Room room;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RoomBoardViewModel>();
    return Expanded(
      flex: 1, // 진척도 부분에 많은 공간을 할당
      child: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              //한주 날짜들 = weekDates
              children: viewModel
                  .splitIntoWeeks(
                viewModel.generateDates(
                  viewModel.getNumberOfWeeks(room.duration),
                  room.startDate ?? DateTime.now(),
                ),
              )
                  .map((weekDates) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 40.0), // 좌우 10, 위아래 40,
                  child: Column(children: [
                    DataTable(
                      dataRowMaxHeight: 50,
                      columnSpacing: 10.0,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      columns: [
                        DataColumn(
                          label: Container(
                            padding: EdgeInsets.symmetric(vertical: 1.0), // 위 아래 패딩 조절
                            child: Text(
                              '멤버',
                              style: TextStyle(fontWeight: FontWeight.bold, ),
                            ),
                          ),
                        ),
                        ...List.generate(weekDates.length, (index) {
                          final date = weekDates[index];
                          return DataColumn(
                            label: Container(
                              padding: EdgeInsets.symmetric(vertical: 1.0),
                              child: Text(
                                viewModel.formatDate(date),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                        }),
                      ],
                      rows: viewModel.generateDataRows(
                        weekDates,
                        room,
                        viewModel.generateDates(
                          viewModel.getNumberOfWeeks(room.duration),
                          room.startDate ?? DateTime.now(),
                        ),
                      ),
                    ),
                  ]),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
