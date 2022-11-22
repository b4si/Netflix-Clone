import 'package:bordered_text/bordered_text.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:netflix_sample/core/constants.dart';
import 'main_title.dart';

class NumberTitleCardWidget extends StatelessWidget {
  const NumberTitleCardWidget({
    Key? key,
    required this.title,
    required this.postersList,
  }) : super(key: key);
  final String title;
  final List<String> postersList;

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
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                postersList.sublist(0, 10).length,
                (index) => NumberCard(
                  index: index,
                  imageUrl: postersList[index],
                ),
              ),
            ),
          ),
        ),
        kHeight,
      ],
    );
  }
}

class NumberCard extends StatelessWidget {
  const NumberCard({
    Key? key,
    required this.index,
    required this.imageUrl,
  }) : super(key: key);
  final int index;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              width: 190,
              height: 200,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: 130,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: kRadius15,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            imageUrl,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: BorderedText(
                        strokeColor: Colors.white,
                        strokeWidth: 16,
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 110,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            kWidth
          ],
        ),
      ],
    );
  }
}
