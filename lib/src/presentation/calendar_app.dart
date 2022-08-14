import 'package:calendar/src/config/route/app_routes.dart';
import 'package:calendar/src/config/theme/app_themes.dart';
import 'package:calendar/src/presentation/pages/main/bloc/main_bloc.dart';
import 'package:calendar/src/presentation/pages/main/news/bloc/news_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalendarApp extends StatelessWidget {
  const CalendarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainBloc>(create: (_) => MainBloc(menu: BottomMenu.HOME)),
        BlocProvider<NewsBloc>(create: (_) => NewsBloc()..add(const InitialNews())),
      ],
      child: BlocBuilder<MainBloc, MainState>(
          builder: (_, state) {
            return MaterialApp(
              title: 'Calendar App',
              debugShowCheckedModeBanner: false,
              theme: AppThemes.light,
              routes: AppRoutes.routes,
              initialRoute: AppRoutes.initial,
            );
          }
      ),
    );
  }
}
