import 'package:calendar/src/data/models/news.dart';
import 'package:calendar/src/data/repository/news_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'news_event.dart';

part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {

  final int _limit = 10;
  int _page = 1;

  NewsBloc() : super(const NewsState(news: [])) {
    on<InitialNews>(_initial);
    on<FetchEvent>(_onFetch);
  }


  _initial(InitialNews event, Emitter<NewsState> emitter) async {
    await getNews(emitter);
  }

  _onFetch(FetchEvent event, Emitter<NewsState> emitter) async {
    if(state.isFetching) {
      return;
    }
    emitter(state.copyWith(isFetching: true));
    // print('page: $_page');
    var result = await NewsRepository.instance.getNews(_limit, _page);
    if (result is List<News>) {
      _page++;
      List<News> list = state.news;
      list.addAll(result);
      emitter(state.copyWith(
        news: list,
        isFetching: false
      ));
    } else {
      // show error message
    }
  }

  Future getNews(Emitter<NewsState> emitter) async {
    var result = await NewsRepository.instance.getNews(_limit, _page);
    if (result is List<News>) {
      _page++;
      emitter(state.copyWith(
        news: result,
        isFetching: false
      ));
    } else {
      // show error message
    }
  }
}
