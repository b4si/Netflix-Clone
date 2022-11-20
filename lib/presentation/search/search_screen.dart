import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_sample/application/search/search_bloc.dart';
import 'package:netflix_sample/core/constants.dart';
import 'package:netflix_sample/domain/core/debounce/debounce.dart';
import 'package:netflix_sample/presentation/search/search_idle_widget.dart';
import 'package:netflix_sample/presentation/search/search_results.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({super.key});

  final _deboincer = Debouncer(milliseconds: 1 * 1000);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const Initialize());
    });
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const Icon(
                  CupertinoIcons.xmark_circle_fill,
                ),
                style: const TextStyle(
                  color: Colors.white,
                ),
                backgroundColor: Colors.grey.withOpacity(0.25),
                onChanged: (value) {
                  if (value.isEmpty) {
                    return;
                  }
                  _deboincer.run(
                    () {
                      BlocProvider.of<SearchBloc>(context).add(
                        SearchMovie(movieQuery: value),
                      );
                    },
                  );
                },
              ),
              kHeight,
              Expanded(child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state.searchResultList.isEmpty) {
                    return const SearchIdleWidget();
                  } else {
                    return const SearchResultWidget();
                  }
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
