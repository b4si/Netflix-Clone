import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_sample/core/constants.dart';
import 'package:netflix_sample/presentation/search/search_idle_widget.dart';
import 'package:netflix_sample/presentation/search/search_results.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
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
              ),
              kHeight,
              const Expanded(child: SearchResultWidget())
              // const Expanded(child: SearchIdleWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
