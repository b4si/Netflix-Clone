import 'package:flutter/material.dart';
import 'package:netflix_sample/core/colors.dart';
import 'package:netflix_sample/presentation/download_screen/screen_download.dart';
import 'package:netflix_sample/presentation/fast_laugh/fast_laugh_page.dart';
import 'package:netflix_sample/presentation/home/screen_home.dart';
import 'package:netflix_sample/presentation/main_page/bottom_nav.dart';
import 'package:netflix_sample/presentation/new_and_hot/new_and_hot.dart';
import 'package:netflix_sample/presentation/search/search_page.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

  final _pages = [
    ScreenHome(),
    ScreenNewAndHot(),
    ScreenFastAndLaugh(),
    ScreenSearch(),
    ScreenDownload(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: indexChangeNotifier,
            builder: ((context, int index, _) {
              return _pages[index];
            })),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
