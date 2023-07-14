import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/news/domain/entities/new.dart';
import 'package:news_app/features/news/presentation/bloc/news_bloc.dart';
import 'package:news_app/features/news/presentation/widgets/home_page/header_widget.dart';
import 'package:news_app/features/news/presentation/widgets/home_page/new_widget.dart';
import 'package:news_app/features/news/presentation/widgets/home_page/search_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final NewsBloc newsBloc;
  late List<New> newList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newsBloc = context.read<NewsBloc>();
    newList = [];
    newsBloc.add(GetNewsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: ,),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const HeaderWidget(),
            SearchWidget(),
            Expanded(
              child: BlocConsumer<NewsBloc, NewsState>(
                listener: (context, state) {
                  if (state is NewsRetrivedState) {
                    newList = state.newList;
                  }
                },
                builder: (context, state) {
                  if (state is LoadingState) {
                    return const Center(
                      child: CupertinoActivityIndicator(),
                    );
                  }
                  if (state is ErrorState) {
                    return Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(fontSize: 16),
                      ),
                    );
                  }
                  if (newList.isEmpty) {
                    return const Center(
                      child: Text(
                        'No data found',
                        style: TextStyle(fontSize: 16),
                      ),
                    );
                  }
                  return Scrollbar(
                    child: ListView.builder(
                        itemCount: newList.length,
                        itemBuilder: ((context, index) {
                          return NewWidget(newItem: newList[index]);
                        })),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
