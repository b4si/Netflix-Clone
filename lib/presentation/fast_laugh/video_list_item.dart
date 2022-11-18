import 'package:flutter/material.dart';
import 'package:netflix_sample/core/colors/colors.dart';
import 'package:netflix_sample/core/constants.dart';

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //Left side

                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black.withOpacity(0.4),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.volume_off_rounded,
                      size: 28,
                      color: kButtonWhite,
                    ),
                  ),
                ),

                //right side

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/vUUqzWa2LnHIVqkaKVlVGkVcZIW.jpg',
                        ),
                      ),
                      kHeight,
                      VideoActionWidget(
                          icon: Icon(Icons.emoji_emotions_outlined),
                          title: "LOL"),
                      kHeight,
                      VideoActionWidget(
                        icon: Icon(Icons.add),
                        title: 'My List',
                      ),
                      kHeight,
                      VideoActionWidget(
                        icon: Icon(Icons.share),
                        title: 'Share',
                      ),
                      kHeight,
                      VideoActionWidget(
                        icon: Icon(Icons.play_arrow_outlined),
                        title: 'Play',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionWidget extends StatelessWidget {
  final Icon icon;
  final String title;
  const VideoActionWidget({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: icon,
          color: Colors.white,
          iconSize: 30,
        ),
        Text(
          title,
          style: const TextStyle(
            color: kButtonWhite,
            fontSize: 15,
          ),
        )
      ],
    );
  }
}
