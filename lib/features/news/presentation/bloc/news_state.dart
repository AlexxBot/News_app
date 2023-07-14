part of 'news_bloc.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsRetrivedState extends NewsState {
  final List<New> newList;
  NewsRetrivedState(this.newList);
}

class LoadingState extends NewsState {
  LoadingState();
}

class ErrorState extends NewsState {
  final String message;
  ErrorState(this.message);
}

class CategoryState extends NewsState {
  /* final Category? category; */
  CategoryState(/* this.category */);
}
