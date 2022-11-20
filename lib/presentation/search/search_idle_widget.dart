import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_sample/application/search/search_bloc.dart';
import 'package:netflix_sample/core/colors.dart';
import 'package:netflix_sample/core/constants.dart';
import 'package:netflix_sample/presentation/search/title.dart';

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
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.isError) {
                return const Center(
                  child: Text(
                    'Error While getting data',
                  ),
                );
              } else if (state.idleList.isEmpty) {
                return const Center(
                  child: Text(
                    'List is Empty',
                  ),
                );
              } else {
                return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    final movie = state.idleList[index];

                    return TopSearchTile(
                        imageUrl: '$imageappendUrl${movie.posterPath}',
                        title: movie.title ?? 'No title Provided');
                  }),
                  separatorBuilder: ((context, index) => kHeight20),
                  itemCount: state.idleList.length,
                );
              }
            },
          ),
        ),
      ],
    );
  }
}

class TopSearchTile extends StatelessWidget {
  final String title;
  final String imageUrl;
  const TopSearchTile({
    super.key,
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.38,
          height: 90,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        kWidth,
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
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
