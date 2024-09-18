import 'package:bhgh/core/router/router.dart';
import 'package:bhgh/domain/model/room.dart';
import 'package:bhgh/presentation/room_board_page/room_board_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DataTableContainer extends StatelessWidget {
  DataTableContainer({super.key, required this.room});

  final Room room;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RoomBoardViewModel>();
    return Expanded(
      flex: 4, // 진척도 부분에 많은 공간을 할당
      child: Container(
        height: 350, // 높이 400px로 설정
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
                              viewModel.formatDate(date),
                              style: TextStyle(fontWeight: FontWeight.bold),
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
