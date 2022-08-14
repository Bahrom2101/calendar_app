part of 'main_bloc.dart';

class MainState extends Equatable {

  final BottomMenu bottomMenu;

  const MainState({required this.bottomMenu});

  MainState copyWith({
    BottomMenu? bottomMenu,
  }) {
    return MainState(
      bottomMenu: bottomMenu ?? this.bottomMenu,
    );
  }
  @override
  List<Object> get props => [bottomMenu];
}

// ignore: constant_identifier_names
enum BottomMenu { HOME, NEWS }