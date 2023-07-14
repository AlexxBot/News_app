import 'package:flutter/material.dart';
import 'package:news_app/core/config/router.dart';
import 'package:news_app/core/utils/format_utils.dart';
import 'package:news_app/core/widgets/image_widget.dart';
import 'package:news_app/features/news/domain/entities/new.dart';

class NewWidget extends StatelessWidget {
  final New newItem;
  const NewWidget({super.key, required this.newItem});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RouteGenerator.newPage,
            arguments: newItem);
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: Container(
          height: MediaQuery.sizeOf(context).height * 0.14,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            children: [
              ImageWidget(
                imageUrl: newItem.imageUrl,
                width: MediaQuery.sizeOf(context).height * 0.18,
                fit: BoxFit.fitHeight,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        newItem.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                      ),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            FormatUtils.dateFormat(newItem.publishedAt),
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey),
                          )),
                      /* ],
                      ) */
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
