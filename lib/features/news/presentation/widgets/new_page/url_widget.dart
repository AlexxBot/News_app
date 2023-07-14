import 'package:flutter/material.dart';
import 'package:news_app/core/config/router.dart';

class TextUrlWidget extends StatelessWidget {
  final String url;
  final double? fontSize;
  const TextUrlWidget({super.key, required this.url, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RouteGenerator.webViewPage,
            arguments: url);
      },
      child: Text(
        'See more',
        style: TextStyle(
            fontSize: fontSize,
            decoration: TextDecoration.underline,
            color: Colors.cyan),
      ),
    );
  }
}
