import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_sample/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix_sample/presentation/fast_laugh/video_list_item.dart';

class ScreenFastAndLaugh extends StatelessWidget {
  const ScreenFastAndLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FastLaughBloc>(context).add(const Initialize2());
    });
    return Scaffold(
      body: SafeArea(child: BlocBuilder<FastLaughBloc, FastLaughState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.isError) {
            const Center(
              child: Text(
                'Error while getting data',
              ),
            );
          } else if (state.videosList.isEmpty) {
            const Center(
              child: Text(
                'Video list is empty',
              ),
            );
          } else {
            return PageView(
              scrollDirection: Axis.vertical,
              children: List.generate(
                state.videosList.length,
                (index) => VideoListItemInheritedWidget(
                  key: Key(
                    index.toString(),
                  ),
                  widget: VideoListItem(index: index),
                  movieData: state.videosList[index],
                ),
              ),
            );
          }
          return const Center(
            child: Text(
              'Error while getting data',
            ),
          );
        },
      )),
    );
  }
}
