import 'package:dartz/dartz.dart';
import 'package:news_app/core/errors/failures.dart';
import 'package:news_app/features/news/domain/entities/category.dart';
import 'package:news_app/features/news/domain/entities/new.dart';
import 'package:news_app/features/news/domain/repository/news_repository.dart';

abstract class NewsUseCase {
  Future<Either<Failure, List<New>>> getNews(
      String keyword, Category? category);
}

class NewsUseCaseImple extends NewsUseCase {
  final NewsRepository repository;

  NewsUseCaseImple({required this.repository});
  @override
  Future<Either<Failure, List<New>>> getNews(
      String keyword, Category? category) async {
    //await Future.delayed(Duration(seconds: 2));

    /* return right([
      New(
          author: "Justine Calma",
          title: "Can banks push Bitcoin to clean up its act?",
          description:
              "Banks and asset managers have a big stake in Bitcoin, so Greenpeace wants them to crack down on the cryptocurrency’s pollution.",
          url:
              "https://www.theverge.com/2023/7/11/23778688/bitcoin-energy-emissions-climate-change-banks-asset-managers-greenpeace",
          imageUrl:
              "https://cdn.vox-cdn.com/thumbor/ODx_QBV2qCE_dfhHtwtaZ8W6J8I=/0x0:7144x4743/1200x628/filters:focal(3572x2372:3573x2373)/cdn.vox-cdn.com/uploads/chorus_asset/file/24763884/1235926940.jpg",
          publishedAt: DateTime(2022, 12, 12),
          content: "")
    ]); */
    if (category != null) {
      return repository.getTopHeadlines(keyword, category);
    }
    if (keyword.isEmpty) {
      return left(
          ClientFailure(message: 'please, Enter a keywork to search news!'));
    }
    return repository.getEverything(keyword);
  }
}
