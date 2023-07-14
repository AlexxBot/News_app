import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/news/domain/entities/category.dart';
import 'package:news_app/features/news/presentation/bloc/news_bloc.dart';

class CheckButtonWidget extends StatelessWidget {
  final Category category;
  final bool active;
  const CheckButtonWidget(
      {super.key, required this.category, this.active = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        child: InkWell(
          onTap: () {
            if (context.read<NewsBloc>().category == category) {
              context.read<NewsBloc>().category = null;
            } else {
              context.read<NewsBloc>().category = category;
            }

            context.read<NewsBloc>().add(GetNewsEvent());
          },
          child: Container(
            decoration: BoxDecoration(
                color:
                    active ? const Color(0XFF1e1e1e) : const Color(0X1F4d4d4d),
                borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Center(
              child: Text(
                '${category.name.substring(0, 1).toUpperCase()}${category.name.substring(1)}',
                style: TextStyle(
                    fontSize: 16,
                    color: active ? Colors.white : const Color(0XFF111111)),
              ),
            ),
          ),
        ));
  }
}
