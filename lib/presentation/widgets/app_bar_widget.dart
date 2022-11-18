import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_sample/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kWidth,
        Text(
          title,
          style: GoogleFonts.montserrat(
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
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
          height: 25,
          width: 25,
          color: Colors.blue,
        ),
        kWidth,
      ],
    );
  }
}
