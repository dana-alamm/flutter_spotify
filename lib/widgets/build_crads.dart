import 'package:flutter/material.dart';

class BuildCrads extends StatelessWidget {
  final String title;
  final Color backgroundColor;

  const BuildCrads({super.key,required this.title,required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:backgroundColor,
        borderRadius: BorderRadius.circular(8),

      ),
      padding: EdgeInsets.all(16),
      child: Text(
        title,
        style: TextStyle(
        fontFamily: 'Gotham',
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.4,
      ),
      ),
    
    );
  }
}