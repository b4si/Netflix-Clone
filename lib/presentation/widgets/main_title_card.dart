import 'package:flutter/material.dart';
import 'package:netflix_sample/core/constants.dart';
import 'package:netflix_sample/presentation/home/main_title.dart';

import 'main_card.dart';

class MainTitleCardWidget extends StatelessWidget {
  const MainTitleCardWidget({
    Key? key,
    required this.title,
    required this.posterList,
  }) : super(key: key);
  final String title;
  final List<String> posterList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: MainTitle(
            title: title,
          ),
        ),
        kHeight,
        LimitedBox(
          maxHeight: 200,
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) => MainCard2(
                    imageUrl: posterList[index],
                  )),
              separatorBuilder: ((context, index) => kWidth),
              itemCount: posterList.sublist(0, 10).length,
            ),
          ),
        ),
        kHeight,
      ],
    );
  }
}
