import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/news/presentation/bloc/news_bloc.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final title =
        '${context.watch<NewsBloc>().category != null ? context.read<NewsBloc>().category!.name : ''} news'
            .trim();
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 15, bottom: 5),
      child: Text(
        '${title.substring(0, 1).toUpperCase()}${title.substring(1)}',
        style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
        textAlign: TextAlign.center,
      ),
    );
  }
}
