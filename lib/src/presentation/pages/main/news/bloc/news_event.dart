part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class InitialNews extends NewsEvent {
  const InitialNews();

  @override
  List<Object> get props => [];
}

class FetchEvent extends NewsEvent {
  const FetchEvent({required this.news});

  final List<News> news;

  @override
  List<Object> get props => [];
}