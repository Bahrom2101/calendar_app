import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_state.dart';
part 'main_event.dart';

class MainBloc extends Bloc<MainEvent, MainState> {

  MainBloc({required BottomMenu menu}) : super(MainState(bottomMenu: menu)) {
    on<MainEventBottomMenuChanged>(_mainEventBottomMenuChanged);
  }

  void _mainEventBottomMenuChanged(MainEventBottomMenuChanged event, Emitter<MainState> emit) {
    emit(state.copyWith(bottomMenu: event.bottomMenu));
  }
}
