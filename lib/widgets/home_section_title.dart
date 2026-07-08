import 'package:flutter/material.dart';

class HomeSectionTitle extends StatelessWidget {
  final String title;
  const HomeSectionTitle({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 16.0, bottom: 12.0),
      child:Text(
        title,
        style:const TextStyle(
          fontFamily: 'Gotham',
          color: Colors.white,
          fontSize: 28,
          fontWeight: FontWeight.w700,
          letterSpacing: 28 * -0.05,
        ),
      ),
      );
  }
}