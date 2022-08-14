import 'package:calendar/src/base/base_function.dart';
import 'package:calendar/src/data/models/Colors_response.dart';
import 'package:calendar/src/data/repository/home_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(TextEditingController textEditingController)
      : super(HomeState(
            dayTextEditController: textEditingController,
            yellowPositions: const [],
            greyPositions: const [],
            greenPositions: const [])) {
    on<InitialHome>(_initial);
    on<ChangeTextEvent>(_onTextChange);
  }

  _initial(InitialHome event, Emitter<HomeState> emitter) async {
    await getColors(emitter);
  }

  _onTextChange(ChangeTextEvent event, Emitter<HomeState> emitter) async {
    switch (event.index) {
      case 0:
        emitter(state.copyWith(day: int.tryParse(event.text)));
        break;
      case 1:
        {
          String dayText = state.dayTextEditController.text;
          var month = int.tryParse(event.text) ?? 0;
          bool isLeapYear = BaseFunctions.isLeapYear(state.year);

          if (month == 1 ||
              month == 3 ||
              month == 5 ||
              month == 7 ||
              month == 8 ||
              month == 10 ||
              month == 12) {
            if (state.day > 31) {
              dayText = '31';
            }
          } else if (month == 4 || month == 6 || month == 9 || month == 11) {
            if (state.day > 30) {
              dayText = '30';
            }
          } else {
            if (state.day > (isLeapYear ? 29 : 28)) {
              dayText = isLeapYear ? '29' : '28';
            }
          }
          emitter(state.copyWith(
              month: int.tryParse(event.text), dayText: dayText));
          break;
        }
      case 2:
        emitter(state.copyWith(year: int.tryParse(event.text)));
        break;
    }
  }

  Future getColors(Emitter<HomeState> emitter) async {
    var result = await HomeRepository.instance.getColors();
    if (result is ColorsResponse) {
      final List<int> greenPositions = [];
      final List<int> yellowPositions = [];
      final List<int> greyPositions = [];

      result.green?.forEach((element) {
        greenPositions.add(int.parse(element));
      });
      result.grey?.forEach((element) {
        greyPositions.add(int.parse(element));
      });
      result.yellow?.forEach((element) {
        yellowPositions.add(int.parse(element));
      });
      emitter(state.copyWith(
        greenPositions: greenPositions,
        greyPositions: greyPositions,
        yellowPositions: yellowPositions,
      ));
    } else {
      // show error message
    }
  }
}
