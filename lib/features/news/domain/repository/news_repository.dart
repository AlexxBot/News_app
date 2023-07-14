import 'package:dartz/dartz.dart';
import 'package:news_app/core/errors/failures.dart';
import 'package:news_app/features/news/domain/entities/category.dart';
import 'package:news_app/features/news/domain/entities/new.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<New>>> getEverything(String keyword);
  Future<Either<Failure, List<New>>> getTopHeadlines(
      String keyword, Category category);
}
