part of 'news_bloc.dart';

@immutable
abstract class NewsEvent {}

class GetNewsEvent extends NewsEvent {
  GetNewsEvent();
}

class SetCategoryEvent extends NewsEvent {
  SetCategoryEvent();
}
