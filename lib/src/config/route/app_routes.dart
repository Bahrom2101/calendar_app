import 'package:calendar/src/presentation/pages/main/main_page.dart';
import 'package:calendar/src/presentation/pages/splash/splash_page.dart';
import 'package:flutter/cupertino.dart';

abstract class AppRoutes {
  AppRoutes._();

  static const initial = '/';
  static const main = '/main';
  static const home = '/home';
  static const photo = '/photos';
  static const video = '/videos';
  static const settings = '/settings';

  static Map<String, WidgetBuilder> routes = {
    AppRoutes.initial: (c) => const SplashPage(),
    AppRoutes.main: (c) => const MainPage(),
  };
}