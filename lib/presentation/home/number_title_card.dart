import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_sample/core/constants.dart';
import 'package:netflix_sample/main.dart';
import 'main_title.dart';

class NumberTitleCardWidget extends StatelessWidget {
  const NumberTitleCardWidget({Key? key, required this.title})
      : super(key: key);
  final String title;

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
              children: List.generate(10, (index) => NumberCard(index: index)),
            ),
          ),
        ),
        kHeight,
      ],
    );
  }
}

class NumberCard extends StatelessWidget {
  const NumberCard({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Container(
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
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            'https://www.themoviedb.org/t/p/w220_and_h330_face/xf9wuDcqlUPWABZNeDKPbZUjWx0.jpg',
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


// Stack(
//               