import 'package:flutter/material.dart';
import 'package:netflix_sample/core/constants.dart';

class MainCard2 extends StatelessWidget {
  const MainCard2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: kRadius15,
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            'https://www.themoviedb.org/t/p/w220_and_h330_face/xf9wuDcqlUPWABZNeDKPbZUjWx0.jpg',
          ),
        ),
      ),
    );
  }
}
