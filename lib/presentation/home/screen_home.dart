import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_sample/core/colors.dart';
import 'package:netflix_sample/core/constants.dart';
import 'package:netflix_sample/presentation/home/number_title_card.dart';
import 'package:netflix_sample/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
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
                ListView(
                  children: const [
                    MainBackgroundImageWidget(),
                    kHeight,
                    MainTitleCardWidget(
                      title: 'Released in the past year',
                    ),
                    MainTitleCardWidget(
                      title: 'New Releases',
                    ),
                    NumberTitleCardWidget(
                      title: 'Old Releases',
                    ),
                    MainTitleCardWidget(
                      title: 'Global Trend',
                    ),
                    MainTitleCardWidget(
                      title: 'National Trend',
                    ),
                  ],
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
