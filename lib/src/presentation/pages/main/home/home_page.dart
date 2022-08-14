import 'package:calendar/src/core/constants/constants.dart';
import 'package:calendar/src/core/utils/input_formatter.dart';
import 'package:calendar/src/presentation/components/calendar.dart';
import 'package:calendar/src/presentation/pages/main/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) =>
          HomeBloc(_textEditingController)..add(const InitialHome()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      width: size.width / 3,
                      height: 50,
                      child: TextField(
                        controller: _textEditingController,
                        onChanged: (text) {
                          context
                              .read<HomeBloc>()
                              .add(ChangeTextEvent(text: text, index: 0));
                        },
                        keyboardType: TextInputType.phone,
                        maxLength: 2,
                        inputFormatters: [
                          DayInputFormatter(state.month, state.year)
                        ],
                        decoration: const InputDecoration(
                          hintText: 'day',
                          counterText: '',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      width: size.width / 3,
                      height: 50,
                      child: TextField(
                        onChanged: (text) {
                          context
                              .read<HomeBloc>()
                              .add(ChangeTextEvent(text: text, index: 1));
                        },
                        keyboardType: TextInputType.phone,
                        maxLength: 2,
                        inputFormatters: [MonthInputFormatter()],
                        decoration: const InputDecoration(
                            hintText: 'month', counterText: ''),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      width: size.width / 3,
                      height: 50,
                      child: TextField(
                        onChanged: (text) {
                          context
                              .read<HomeBloc>()
                              .add(ChangeTextEvent(text: text, index: 2));
                        },
                        keyboardType: TextInputType.phone,
                        maxLength: 4,
                        decoration: const InputDecoration(
                            hintText: 'year', counterText: ''),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Calendar(
                  width: size.width * 0.8,
                  day: state.day,
                  month: state.month,
                  year: state.year,
                  greyPositions: state.greyPositions,
                  yellowPositions: state.yellowPositions,
                  greenPositions: state.greenPositions,
                  onTap: (color, day) {
                    Constants.scaffoldKey.currentState?.showSnackBar(SnackBar(
                        content:
                            Text('Color: ${color.toString()}, day: $day')));
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
