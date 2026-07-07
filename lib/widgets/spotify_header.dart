import 'package:flutter/material.dart';

class SpotifyHeader extends StatelessWidget {
  const SpotifyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/white_spotify.png',
        height: 90,
        width: 90,),
        const SizedBox(height: 30),
        const Text(
          'Millions of songs\nFree on Spotify.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
        ),
        
      ],
    );
  }
}