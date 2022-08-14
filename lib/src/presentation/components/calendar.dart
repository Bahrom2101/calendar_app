import 'package:calendar/src/config/theme/app_colors.dart';
import 'package:flutter/widgets.dart';

class Calendar extends StatelessWidget {
  const Calendar({
    Key? key,
    required this.width,
    required this.day,
    required this.month,
    required this.year,
    required this.greenPositions,
    required this.yellowPositions,
    required this.greyPositions,
    required this.onTap,
  }) : super(key: key);

  final double width;
  final int day;
  final int month;
  final int year;
  final List<int> greenPositions;
  final List<int> yellowPositions;
  final List<int> greyPositions;
  final Function(Color, String) onTap;

  @override
  Widget build(BuildContext context) {
    List<String> weekDays = ['Mon', 'Tue', 'Wen', 'Thu', 'Fri', 'Sat', 'Sun'];
    int allDaysCount = 0;
    int firstDayIndex = 0;
    if (day != 0 && month != 0 && year != 0) {
      var dateTime = DateTime(year, month, day);
      allDaysCount =
          DateTime(year, month + 1, day).toUtc().difference(dateTime).inDays;
      var firstDateOfMonth = DateTime(year, month, 1);
      firstDayIndex = firstDateOfMonth.weekday;
    }
    return Container(
      width: width,
      height: width + 2,
      color: AppColors.white,
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          SizedBox(
            height: width / 7,
            child: Row(
              children: List.generate(
                weekDays.length,
                (index) => Expanded(
                  child: Text(
                    weekDays[index],
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: weekDays.length,
            children: List.generate(
              allDaysCount > 0 ? allDaysCount + firstDayIndex - 1 : 0,
              (index) {
                Color color = AppColors.white;
                if (greenPositions.contains(index - firstDayIndex + 2)) {
                  color = AppColors.green;
                } else if (greyPositions.contains(index - firstDayIndex + 2)) {
                  color = AppColors.grey;
                } else if (yellowPositions.contains(index - firstDayIndex + 2)) {
                  color = AppColors.yellow;
                }
                return GestureDetector(
                  onTap: () {
                    if (color != AppColors.white) {
                      onTap(
                          color,
                          index - (firstDayIndex - 1) < 0
                              ? ''
                              : '${index - firstDayIndex + 2}');
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.all(2),
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index - (firstDayIndex - 1) < 0
                          ? AppColors.white
                          : color,
                    ),
                    child: Center(
                      child: Text(
                        index - (firstDayIndex - 1) < 0
                            ? ''
                            : '${index - firstDayIndex + 2}',
                        style: TextStyle(
                            fontSize: 15,
                            color: (index + 1) % 7 == 0
                                ? AppColors.red
                                : color == AppColors.green ||
                                        color == AppColors.yellow
                                    ? AppColors.white
                                    : AppColors.black),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
