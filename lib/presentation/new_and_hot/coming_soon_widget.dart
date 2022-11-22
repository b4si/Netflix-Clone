import 'package:flutter/material.dart';
import 'package:netflix_sample/core/colors.dart';
import 'package:netflix_sample/core/constants.dart';
import 'package:netflix_sample/presentation/home/screen_home.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;

  const ComingSoonWidget({
    super.key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 450,
      width: double.infinity,
      child: Row(
        children: [
          Column(
            children: [
              Container(
                width: size.width * 0.2,
                height: 450,
                color: Colors.black,
                child: Column(
                  children: [
                    Text(
                      month,
                      style: const TextStyle(fontSize: 22, color: Colors.grey),
                    ),
                    Text(
                      day,
                      style: const TextStyle(
                        fontSize: 32,
                        letterSpacing: 4,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: size.width * 0.77,
                    height: 180,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(posterPath),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: size.width * 0.50,
                    height: 45,
                    child: Text(
                      movieName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: const TextStyle(
                        letterSpacing: -3,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const CustomButtonWidget(
                    icon: Icons.all_out_sharp,
                    title: 'Remind me',
                    iconSize: 30,
                    titleSize: 12,
                    letterSpeacing: 0,
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  const CustomButtonWidget(
                    icon: Icons.info,
                    title: 'Info',
                    iconSize: 30,
                    titleSize: 12,
                  ),
                ],
              ),
              kHeight,
              Text('Coming on $day'),
              kHeight,
              SizedBox(
                width: size.width * 0.80,
                height: 35,
                child: Text(
                  movieName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.75,
                child: Text(
                  description,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.grey, fontSize: 17),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
