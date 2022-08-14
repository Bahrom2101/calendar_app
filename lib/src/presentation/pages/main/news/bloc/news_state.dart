part of 'news_bloc.dart';

// ignore: must_be_immutable
class NewsState extends Equatable {
  NewsState({
    required this.news,
    this.isFetching = false,
  });

  List<News> news;
  bool isFetching;

  NewsState copyWith({
    List<News>? news,
    bool? isFetching,
  }) {
    return NewsState(
      news: news ?? this.news,
      isFetching: isFetching ?? this.isFetching,
    );
  }

  @override
  List<Object> get props => [news, isFetching];
}
