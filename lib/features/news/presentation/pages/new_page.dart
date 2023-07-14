import 'package:flutter/material.dart';
import 'package:news_app/features/news/domain/entities/new.dart';
import 'package:news_app/features/news/presentation/widgets/new_page/portrait_widget.dart';

class NewPage extends StatefulWidget {
  final New newItem;
  const NewPage({super.key, required this.newItem});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PortraitWidget(newItem: widget.newItem),
        ],
      ),
    );
  }
}
