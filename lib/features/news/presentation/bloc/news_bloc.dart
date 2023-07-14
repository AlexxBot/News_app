import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/features/news/domain/entities/category.dart';
import 'package:news_app/features/news/domain/entities/new.dart';
import 'package:news_app/features/news/domain/use_cases/news_use_cases.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsUseCase useCase;
  NewsBloc(this.useCase) : super(NewsInitial()) {
    on<GetNewsEvent>(_getNewsEvent);
  }

  Category? category = Category.business;
  String keyword = '';

  Future<void> _getNewsEvent(
      GetNewsEvent event, Emitter<NewsState> emit) async {
    if (category != null) emit(CategoryState());
    emit(LoadingState());
    final response = await useCase.getNews(keyword, category);
    response.fold((failure) => emit(ErrorState(failure.message)),
        (newList) => emit(NewsRetrivedState(newList)));
  }
}
