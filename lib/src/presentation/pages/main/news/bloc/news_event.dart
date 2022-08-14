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
  const FetchEvent();

  @override
  List<Object> get props => [];
}