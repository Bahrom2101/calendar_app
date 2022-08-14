part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object> get props => [];
}

class MainEventBottomMenuChanged extends MainEvent {
  final BottomMenu bottomMenu;

  const MainEventBottomMenuChanged({required this.bottomMenu});
}