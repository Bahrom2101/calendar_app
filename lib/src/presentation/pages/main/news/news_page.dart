import 'package:calendar/src/config/theme/app_colors.dart';
import 'package:calendar/src/presentation/pages/main/news/bloc/news_bloc.dart';
import 'package:calendar/src/presentation/pages/main/news/widgets/news_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsPage extends StatelessWidget {
  NewsPage({Key? key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        return SingleChildScrollView(
          controller: _scrollController
            ..addListener(() {
              if (_scrollController.offset ==
                      _scrollController.position.maxScrollExtent &&
                  !state.isFetching) {
                context.read<NewsBloc>().add(FetchEvent(news: state.news));
              }
            }),
          child: Column(
            children: [
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.news.length,
                shrinkWrap: true,
                itemBuilder: (_, index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 5,
                  ),
                  child: NewsItem(
                      title: state.news[index].title ?? '',
                      body: state.news[index].body ?? ''),
                ),
                separatorBuilder: (_, index) => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(
                    thickness: 0.5,
                    height: 0.5,
                    color: AppColors.black,
                  ),
                ),
              ),
              if (state.isFetching)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                        width: 35,
                        height: 35,
                        child: CircularProgressIndicator()),
                  ],
                )
            ],
          ),
        );
      },
    );
  }
}
