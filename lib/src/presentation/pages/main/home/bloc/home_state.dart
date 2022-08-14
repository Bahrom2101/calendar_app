part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.day = 0,
    this.month = 0,
    this.year = 0,
    required this.dayTextEditController,
    required this.greenPositions,
    required this.greyPositions,
    required this.yellowPositions,
  });

  final int day;
  final int month;
  final int year;
  final TextEditingController dayTextEditController;
  final List<int> greenPositions;
  final List<int> yellowPositions;
  final List<int> greyPositions;

  HomeState copyWith({
    int? day,
    int? month,
    int? year,
    String? dayText,
    List<int>? greenPositions,
    List<int>? yellowPositions,
    List<int>? greyPositions,
  }) {
    if (dayText != null) {
      dayTextEditController.text = dayText;
    }
    return HomeState(
      day: day ?? this.day,
      month: month ?? this.month,
      year: year ?? this.year,
      dayTextEditController: dayTextEditController,
      greenPositions: greenPositions ?? this.greenPositions,
      greyPositions: greyPositions ?? this.greyPositions,
      yellowPositions: yellowPositions ?? this.yellowPositions,
    );
  }

  @override
  List<Object> get props => [day, month, year, dayTextEditController];
}
