import 'package:flutter/material.dart';
import 'package:netflix_sample/core/colors/colors.dart';
import 'package:netflix_sample/core/constants.dart';
import 'package:netflix_sample/presentation/home/screen_home.dart';

class EveryoneWatchingWidget extends StatelessWidget {
  const EveryoneWatchingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      // color: Colors.amber,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/nMKdUUepR0i5zn0y1T4CsSB5chy.jpg',
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.black.withOpacity(0.4),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.volume_off_rounded,
                        size: 20,
                        color: kButtonWhite,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          kHeight,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const SizedBox(
                  width: 100,
                  child: Text(
                    'LOST IN SPACE',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -2),
                  ),
                ),
                const Spacer(),
                Row(
                  children: const [
                    CustomButtonWidget(
                      icon: Icons.share_outlined,
                      title: 'Share',
                      titleSize: 12,
                    ),
                    kWidth,
                    CustomButtonWidget(
                      icon: Icons.add,
                      title: 'My List',
                      titleSize: 12,
                    ),
                    kWidth,
                    CustomButtonWidget(
                      icon: Icons.play_arrow,
                      title: 'Play',
                      titleSize: 12,
                    ),
                    kWidth,
                  ],
                ),
              ],
            ),
          ),
          kHeight,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Text(
                  'Lost in Space',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'This hit sitcom follows the merry misadventures if six 20-something pals as they navigate the pitfalls of work, life and love in 1990s Manhattan.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
          )
        ],
      ),
    );
  }
}
