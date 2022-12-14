import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_sample/application/downloads/downloads_bloc.dart';
import 'package:netflix_sample/core/colors.dart';
import 'package:netflix_sample/core/constants.dart';
import 'package:netflix_sample/presentation/widgets/app_bar_widget.dart';

class ScreenDownload extends StatelessWidget {
  ScreenDownload({super.key});

  final _widgetList = [
    const _SmartDownloads(),
    Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          title: 'Downloads ',
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemBuilder: ((context, index) => _widgetList[index]),
        separatorBuilder: ((context, index) => const SizedBox(
              height: 25,
            )),
        itemCount: _widgetList.length,
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<DownloadsBloc>(context).add(
        const DownloadsEvent.getDownloadsImages(),
      );
    });
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        const Text(
          "Introducing Downloads for you",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kButtonWhite,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        kHeight,
        const Text(
          "We will download a personalised selection of\nmovies and shows for you,so there's\nalways something to watch on your\ndevice",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            return SizedBox(
              width: size.width,
              height: size.width,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  state.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : CircleAvatar(
                          backgroundColor: Colors.grey.withOpacity(
                            0.3,
                          ),
                          radius: size.width * 0.35,
                        ),
                  DownloadsImageWidget(
                    size: Size(
                      size.width * 0.37,
                      size.height * 0.26,
                    ),
                    imageList:
                        '$imageappendUrl${state.downloads[0].posterPath}',
                    margin: const EdgeInsets.only(
                      left: 170,
                      top: 25,
                    ),
                    angle: 17,
                  ),
                  DownloadsImageWidget(
                    size: Size(
                      size.width * 0.37,
                      size.height * 0.26,
                    ),
                    imageList:
                        '$imageappendUrl${state.downloads[1].posterPath}',
                    margin: const EdgeInsets.only(right: 170, top: 20),
                    angle: -17,
                  ),
                  DownloadsImageWidget(
                    size: Size(
                      size.width * 0.4,
                      size.height * 0.30,
                    ),
                    imageList:
                        '$imageappendUrl${state.downloads[2].posterPath}',
                    margin: const EdgeInsets.only(
                      top: 25,
                      bottom: 10,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kButtonBlue,
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Text(
                'Set up',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kButtonWhite,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
        kHeight,
        MaterialButton(
          color: kButtonWhite,
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Text(
              'See what you can download',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.settings_outlined,
          color: Colors.white,
        ),
        kWidth,
        Text(
          'Smart Downloads',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    Key? key,
    this.angle = 0,
    required this.size,
    required this.margin,
    required this.imageList,
  }) : super(key: key);

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  imageList,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
