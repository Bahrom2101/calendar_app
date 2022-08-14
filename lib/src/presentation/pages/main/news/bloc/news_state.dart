part of 'news_bloc.dart';

class NewsState extends Equatable {
  const NewsState({
    required this.news,
    this.isFetching = true,
  });

  final List<News> news;
  final bool isFetching;

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
