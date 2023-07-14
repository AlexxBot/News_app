import 'package:flutter/material.dart';
import 'package:news_app/features/news/domain/entities/new.dart';
import 'package:news_app/features/news/presentation/pages/home_page.dart';
import 'package:news_app/features/news/presentation/pages/new_page.dart';
import 'package:news_app/features/news/presentation/pages/web_view_page.dart';

class RouteGenerator {
  static const String homePage = '/';
  static const String newPage = '/newPage';
  static const String webViewPage = '/webViewPage';

  RouteGenerator._(); //Contructor private

  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case newPage:
        final newItem = settings.arguments as New;
        return MaterialPageRoute(builder: (_) => NewPage(newItem: newItem));
      case webViewPage:
        final url = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => WebViewPage(url: url));
      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}
