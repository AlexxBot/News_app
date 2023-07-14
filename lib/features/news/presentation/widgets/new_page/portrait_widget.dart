import 'package:flutter/material.dart';
import 'package:news_app/core/utils/format_utils.dart';
import 'package:news_app/core/widgets/image_widget.dart';
import 'package:news_app/features/news/domain/entities/new.dart';
import 'package:news_app/features/news/presentation/widgets/new_page/url_widget.dart';

class PortraitWidget extends StatelessWidget {
  final New newItem;
  const PortraitWidget({super.key, required this.newItem});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height,
        ),
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ImageWidget(
                imageUrl: newItem.imageUrl,
                height: MediaQuery.sizeOf(context)
                    .height /*  *
                  1.4, */ /* fit: BoxFit.fitHeight */
                ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.9,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomCenter,
                )),
              ),
            ),
            Positioned(
              top: 40,
              left: 0,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                iconSize: 30,
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      newItem.title,
                      style: const TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        FormatUtils.dateFormat(newItem.publishedAt),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  //shrinkWrap: true,
                  children: [
                    if (newItem.author != null &&
                        newItem.author!.trim().isNotEmpty)
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: Chip(
                            backgroundColor: const Color(0XFF1e1e1e),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            label: Text(
                              '${newItem.author}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Wrap(children: [
                        Text(
                          newItem.description,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ]),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextUrlWidget(
                        url: newItem.url,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    )
                    //Text(newItem.content)
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
