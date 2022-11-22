import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:netflix_sample/core/constants.dart';

class MainCard2 extends StatelessWidget {
  final String imageUrl;
  const MainCard2({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: kRadius15,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            imageUrl,
          ),
        ),
      ),
    );
  }
}
