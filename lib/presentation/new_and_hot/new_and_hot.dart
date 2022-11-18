import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_sample/core/colors/colors.dart';
import 'package:netflix_sample/core/constants.dart';
import 'package:netflix_sample/presentation/home/screen_home.dart';
import 'package:netflix_sample/presentation/new_and_hot/everyoneswatching_widget.dart';

import 'coming_soon_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'New & Hot',
              style: GoogleFonts.montserrat(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
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
                height: 10,
                width: 30,
                color: Colors.blue,
              ),
              kWidth,
              kWidth,
            ],
            bottom: TabBar(
                isScrollable: true,
                unselectedLabelColor: kButtonWhite,
                labelColor: Colors.black,
                labelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                indicator: BoxDecoration(
                  color: kButtonWhite,
                  borderRadius: kRadius30,
                ),
                tabs: const [
                  Tab(
                    text: "🍿 Coming Soon",
                  ),
                  Tab(
                    text: "👀 Everyone's Watching",
                  ),
                ]),
          ),
          body: TabBarView(children: [
            _buildComingSoon(),
            _buildEveryonesWatching(),
          ])),
    );
  }

  Widget _buildComingSoon() {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, index) {
            return const ComingSoonWidget();
          }),
    );
  }

  Widget _buildEveryonesWatching() {
    return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, index) {
              return const EveryoneWatchingWidget();
            }));
  }
}
