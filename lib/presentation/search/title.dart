import 'package:flutter/material.dart';

class SearchTextTitle extends StatelessWidget {
  const SearchTextTitle({
    required this.title,
    Key? key,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
