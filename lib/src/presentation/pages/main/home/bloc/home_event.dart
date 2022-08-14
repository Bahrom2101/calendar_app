part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class InitialHome extends HomeEvent {
  const InitialHome();
}

class ChangeTextEvent extends HomeEvent {
  const ChangeTextEvent({
    required this.text,
    required this.index,
  });

  final String text;
  final int index;
}
