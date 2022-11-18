import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_sample/core/colors/colors.dart';
import 'package:netflix_sample/core/constants.dart';
import 'package:netflix_sample/presentation/search/title.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/etj8E2o0Bud0HkONVQPjyCkIvpv.jpg';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(
          title: "Top Search",
        ),
        kHeight,
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: ((context, index) => const TopSearchTile()),
            separatorBuilder: ((context, index) => kHeight20),
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}

class TopSearchTile extends StatelessWidget {
  const TopSearchTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.38,
          height: 90,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        kWidth,
        const Expanded(
          child: Text(
            'Movie name',
            style: TextStyle(
              color: kButtonWhite,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ),
        CircleAvatar(
          backgroundColor: kButtonWhite,
          radius: 25,
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 23,
            child: IconButton(
              onPressed: () {},
              icon: const Padding(
                padding: EdgeInsets.only(left: 2),
                child: Icon(
                  CupertinoIcons.play_fill,
                  color: kButtonWhite,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
