import 'package:flutter/material.dart';
import 'package:netflix_sample/core/colors.dart';
import 'package:netflix_sample/core/constants.dart';
import 'package:netflix_sample/presentation/home/screen_home.dart';

class EveryoneWatchingWidget extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String description;

  const EveryoneWatchingWidget({
    super.key,
    required this.posterPath,
    required this.movieName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 420,
      // color: Colors.amber,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      posterPath,
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
                SizedBox(
                  width: 100,
                  child: Text(
                    movieName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
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
              children: [
                SizedBox(
                  width: size.width * 0.9,
                  height: 30,
                  child: Text(
                    movieName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
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
