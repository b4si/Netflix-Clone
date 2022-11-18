import 'package:flutter/material.dart';
import 'package:netflix_sample/core/colors/colors.dart';
import 'package:netflix_sample/core/constants.dart';
import 'package:netflix_sample/presentation/home/screen_home.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    Key? key,
  }) : super(key: key);

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
                  children: const [
                    Text(
                      'FEB',
                      style: TextStyle(fontSize: 22, color: Colors.grey),
                    ),
                    Text(
                      '11',
                      style: TextStyle(
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
                    width: size.width * 0.78,
                    height: 180,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/mvyERNa0oNsBjbHqn5qSGMHk2FM.jpg',
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
              Row(
                children: [
                  const Text(
                    'TALL GIRL 2',
                    style: TextStyle(
                      letterSpacing: -5,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.180,
                  ),
                  Row(
                    children: const [
                      CustomButtonWidget(
                        icon: Icons.all_out_sharp,
                        title: 'Remind me',
                        iconSize: 30,
                        titleSize: 12,
                        letterSpeacing: 0,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      CustomButtonWidget(
                        icon: Icons.info,
                        title: 'Info',
                        iconSize: 30,
                        titleSize: 12,
                      ),
                    ],
                  ),
                ],
              ),
              kHeight,
              const Text('Coming on Friday'),
              kHeight,
              const Text(
                "Tall Girl 2",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kHeight,
              SizedBox(
                width: size.width * 0.75,
                child: const Text(
                  '''Landing the lead in the School musical is a dream come true for Jodi, until the pressure sends her confidence -- and her relationship -- into a into a tailspin''',
                  style: TextStyle(color: Colors.grey, fontSize: 17),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
