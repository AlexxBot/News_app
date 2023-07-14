import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app/core/errors/exceptions.dart';
import 'package:news_app/core/errors/failures.dart';
import 'package:news_app/core/network/network_Info.dart';
import 'package:news_app/features/news/data/data_sources/news_remote_data.dart';
import 'package:news_app/features/news/domain/entities/category.dart';
import 'package:news_app/features/news/domain/entities/new.dart';
import 'package:news_app/features/news/domain/repository/news_repository.dart';

class NewsRepositoryImple extends NewsRepository {
  final NewsRemoteData remoteData;
  final NetworkInfo networkInfo;

  NewsRepositoryImple({required this.remoteData, required this.networkInfo});

  @override
  Future<Either<Failure, List<New>>> getEverything(String keyword) async {
    if (await networkInfo.isConnected) {
      try {
        final pokemons = await remoteData.getEverything(keyword);
        return Right(pokemons);
      } on ApiResponseException catch (m) {
        return Left(ApiResponseFailure(/* message: m.message */));
      } /* on TimeOutException {
        return Left(TimeOutFailure());
      }  */
      on DioException catch (ex) {
        if (ex.type == DioExceptionType.receiveTimeout ||
            ex.type == DioExceptionType.connectionTimeout) {
          throw Left(Exception("Connection Timeout Exception"));
        }
        return Left(ServerFailure(/* message: ex.toString() */));
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<New>>> getTopHeadlines(
      String keyword, Category category) async {
    if (await networkInfo.isConnected) {
      try {
        final pokemons = await remoteData.getTopHeadlines(keyword, category);
        return Right(pokemons);
      } on ApiResponseException catch (m) {
        return Left(ApiResponseFailure(/* message: m.message */));
      } /* on TimeOutException {
        return Left(TimeOutFailure());
      }  */
      on DioException catch (ex) {
        if (ex.type == DioExceptionType.receiveTimeout ||
            ex.type == DioExceptionType.connectionTimeout) {
          throw Left(Exception("Connection Timeout Exception"));
        }
        return Left(ServerFailure(/* message: ex.toString() */));
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
