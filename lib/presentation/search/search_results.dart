import 'package:flutter/material.dart';
import 'package:netflix_sample/core/constants.dart';
import 'package:netflix_sample/presentation/search/search_idle_widget.dart';
import 'package:netflix_sample/presentation/search/title.dart';

const imageUrl2 =
    'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/vUUqzWa2LnHIVqkaKVlVGkVcZIW.jpg';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(
          title: 'Movies & TV',
        ),
        kHeight,
        Expanded(
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 9,
            crossAxisSpacing: 9,
            childAspectRatio: 1 / 1.6,
            children: List.generate(
              20,
              (index) => const MainCard(),
            ),
          ),
        ),
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: const DecorationImage(
            image: NetworkImage(imageUrl2),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(8)),
    );
  }
}
