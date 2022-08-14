import 'package:calendar/src/config/theme/app_colors.dart';
import 'package:calendar/src/presentation/pages/main/news/bloc/news_bloc.dart';
import 'package:calendar/src/presentation/pages/main/news/widgets/news_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsPage extends StatelessWidget {
  NewsPage({Key? key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  setListener(NewsBloc bloc) {
    _scrollController.addListener(() {
      if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        bloc.add(const FetchEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<NewsBloc>();
    setListener(bloc);
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (_, state) {
        return ListView.separated(
          controller: _scrollController,
          itemCount: state.news.length + (state.isFetching ? 1 : 0),
          shrinkWrap: true,
          itemBuilder: (_, index) {
            if (index < state.news.length) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 5,
                ),
                child: NewsItem(
                    title: '${state.news[index].id}.${state.news[index].title}',
                    body: state.news[index].body ?? ''),
              );
            } else {
              Future.delayed(const Duration(milliseconds: 30)).then((value) =>
                  _scrollController
                      .jumpTo(_scrollController.position.maxScrollExtent));
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                      width: 35,
                      height: 35,
                      child: CircularProgressIndicator()),
                ],
              );
            }
          },
          separatorBuilder: (_, index) => const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Divider(
              thickness: 0.5,
              height: 0.5,
              color: AppColors.black,
            ),
          ),
        );
      },
    );
  }
}
