import 'package:calendar/src/config/theme/app_colors.dart';
import 'package:calendar/src/presentation/pages/main/bloc/main_bloc.dart';
import 'package:calendar/src/presentation/pages/main/home/home_page.dart';
import 'package:calendar/src/presentation/pages/main/news/news_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(title: const Text('Calendar')),
            body: IndexedStack(
              index: state.bottomMenu.index,
              children: [
                HomePage(),
                NewsPage(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                context.read<MainBloc>().add(MainEventBottomMenuChanged(
                    bottomMenu: BottomMenu.values[index]));
              },
              currentIndex: state.bottomMenu.index,
              unselectedItemColor: AppColors.greyBD,
              showSelectedLabels: true,
              selectedItemColor: AppColors.blue,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.edit_note_sharp), label: 'Notes'),
              ],
            ),
          ),
        );
      },
    );
  }
}
