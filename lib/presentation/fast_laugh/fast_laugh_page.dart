import 'package:flutter/material.dart';
import 'package:netflix_sample/presentation/fast_laugh/video_list_item.dart';

class ScreenFastAndLaugh extends StatelessWidget {
  const ScreenFastAndLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: PageView(
        scrollDirection: Axis.vertical,
        children: List.generate(
          10,
          (index) => VideoListItem(
            index: index,
          ),
        ),
      )),
    );
  }
}
