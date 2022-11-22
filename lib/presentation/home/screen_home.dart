// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_sample/application/home/home_bloc.dart';
import 'package:netflix_sample/core/colors.dart';
import 'package:netflix_sample/core/constants.dart';
import 'package:netflix_sample/presentation/home/number_title_card.dart';
import 'package:netflix_sample/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        BlocProvider.of<HomeBloc>(context).add(
          const GetHomeScreenData(),
        );
      },
    );
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (BuildContext context, index, _) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      );
                    } else if (state.hasError) {
                      return const Center(
                        child: Text(
                          'Error while getting data',
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    } else {
                      // released past year

                      final _releasedPastYear = state.pastYearMovieList.map(
                        (e) {
                          return '$imageappendUrl${e.posterPath}';
                        },
                      ).toList();

                      // Trending

                      final _trending = state.trendingMovieList.map(
                        (e) {
                          return '$imageappendUrl${e.posterPath}';
                        },
                      ).toList();

                      // tense dramas

                      final _tenseDramas = state.tenseDramasMovieList.map(
                        (e) {
                          return '$imageappendUrl${e.posterPath}';
                        },
                      ).toList();

                      // south indian movies

                      final _southIndianList = state.southIndianMovieList.map(
                        (e) {
                          return '$imageappendUrl${e.posterPath}';
                        },
                      ).toList();

                      // top 10 tv shows

                      final _top10Tvshow = state.trendingTvList.map(
                        (e) {
                          return '$imageappendUrl${e.posterPath}';
                        },
                      ).toList();

                      return ListView(
                        children: [
                          const MainBackgroundImageWidget(),
                          kHeight,
                          MainTitleCardWidget(
                            title: 'Released in the past year',
                            posterList: _releasedPastYear,
                          ),
                          MainTitleCardWidget(
                            title: 'Trending Now',
                            posterList: _trending,
                          ),
                          NumberTitleCardWidget(
                            title: 'Top 10 Tv shows in India Today',
                            postersList: _top10Tvshow,
                          ),
                          MainTitleCardWidget(
                            title: 'Tense Dramas',
                            posterList: _tenseDramas,
                          ),
                          MainTitleCardWidget(
                            title: 'South Indian Cinema',
                            posterList: _southIndianList,
                          ),
                        ],
                      );
                    }
                  },
                ),
                scrollNotifier.value == true
                    ? AnimatedContainer(
                        duration: const Duration(
                          milliseconds: 5000,
                        ),
                        width: double.infinity,
                        color: Colors.black.withOpacity(0.3),
                        height: 80,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets\\pngegg.png',
                                  width: 58,
                                  height: 58,
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.cast,
                                    color: Colors.white,
                                    size: 27,
                                  ),
                                ),
                                kWidth,
                                Container(
                                  height: 25,
                                  width: 25,
                                  color: Colors.blue,
                                ),
                                kWidth,
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'TV Shows',
                                  style: kHomeTitleText,
                                ),
                                Text(
                                  'Movies',
                                  style: kHomeTitleText,
                                ),
                                Text(
                                  'Categories',
                                  style: kHomeTitleText,
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    : kHeight
              ],
            ),
          );
        },
      ),
    );
  }
}

class MainBackgroundImageWidget extends StatelessWidget {
  const MainBackgroundImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 500,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                kMainImage,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                CustomButtonWidget(
                  icon: Icons.add,
                  title: 'My List',
                ),
                PlayButtonWidget(),
                CustomButtonWidget(
                  icon: Icons.info_outline_rounded,
                  title: 'Info',
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    Key? key,
    this.letterSpeacing = 0,
    this.iconSize = 25,
    this.titleSize = 14,
    required this.icon,
    required this.title,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final double iconSize;
  final double titleSize;
  final double letterSpeacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: iconSize,
          color: kButtonWhite,
        ),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: titleSize,
            letterSpacing: letterSpeacing,
          ),
        )
      ],
    );
  }
}

class PlayButtonWidget extends StatelessWidget {
  const PlayButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(kButtonWhite)),
      onPressed: () {},
      icon: const Icon(
        Icons.play_arrow,
        color: Colors.black,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          'Play',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
