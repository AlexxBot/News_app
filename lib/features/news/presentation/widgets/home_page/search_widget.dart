import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/news/presentation/widgets/home_page/check_button_widget.dart';
import 'package:news_app/features/news/domain/entities/category.dart';
import 'package:news_app/features/news/presentation/bloc/news_bloc.dart';

// ignore: must_be_immutable
class SearchWidget extends StatelessWidget {
  SearchWidget({super.key});

  void _handleSearch(BuildContext context, String keywork) {
    context.read<NewsBloc>().keyword = keywork;
    context.read<NewsBloc>().add(GetNewsEvent());
  }

  Category? currentCategory;

  final categories = Category.values.map((e) => e).toList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 75,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: TextFormField(
            onFieldSubmitted: (String? keyword) =>
                _handleSearch(context, keyword ?? ''),
            style: const TextStyle(fontSize: 18),
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0X1F4d4d4d),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              hintText: "Search for News",
              prefixIcon: const Icon(Icons.search),
              prefixIconColor: Colors.black,
            ),
          ),
        ),
        Container(
            height: 60,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: ((context, index) => CheckButtonWidget(
                      category: categories[index],
                      active: categories[index] ==
                          context.watch<NewsBloc>().category,
                    )))),
        const SizedBox(
          height: 5,
        )
      ],
    );
  }
}
