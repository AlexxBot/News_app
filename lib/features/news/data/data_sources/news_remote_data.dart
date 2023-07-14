import 'package:dio/dio.dart';
import 'package:news_app/core/errors/exceptions.dart';
import 'package:news_app/core/network/network_Info.dart';
import 'package:news_app/features/news/domain/entities/category.dart';
import 'package:news_app/features/news/domain/entities/new.dart';
import 'package:news_app/injections.dart';

abstract class NewsRemoteData {
  Future<List<New>> getEverything(String keyword);
  Future<List<New>> getTopHeadlines(String keyword, Category category);
}

class NewsRemoteDataImple extends NewsRemoteData {
  late final Dio client;

  NewsRemoteDataImple({required this.client});

  @override
  Future<List<New>> getEverything(String keyword) async {
    final uri = Uri.parse(
        '${sl<NetworkInfo>().url}/everything?q=$keyword&${sl<NetworkInfo>().apiKey}');
    final response = await client.getUri(uri,
        options: Options(
          sendTimeout: Duration(seconds: sl<NetworkInfo>().timeOut),
          receiveTimeout: Duration(seconds: sl<NetworkInfo>().timeOut),
        ));
    if (response.statusCode == 200) {
      final List newListJson = (response.data as Map)['articles'];
      final List<New> newList =
          newListJson.map((newJson) => New.fromJson(newJson)).toList();
      return newList;
    } else {
      throw ApiResponseException(statusCode: response.statusCode ?? 500);
    }
  }

  @override
  Future<List<New>> getTopHeadlines(String keyword, Category category) async {
    String query = '';
    if (keyword.isNotEmpty) {
      query = 'q=$keyword&';
    }
    final uri = Uri.parse(
        '${sl<NetworkInfo>().url}/top-headlines?${query}category=${category.name}&country=us&${sl<NetworkInfo>().apiKey}');
    final response = await client.getUri(uri,
        options: Options(
          sendTimeout: Duration(seconds: sl<NetworkInfo>().timeOut),
          receiveTimeout: Duration(seconds: sl<NetworkInfo>().timeOut),
        ));
    if (response.statusCode == 200) {
      final List newListJson = (response.data as Map)['articles'];
      final List<New> newList =
          newListJson.map((newJson) => New.fromJson(newJson)).toList();
      return newList;
    } else {
      throw ApiResponseException(statusCode: response.statusCode ?? 500);
    }
  }
}
