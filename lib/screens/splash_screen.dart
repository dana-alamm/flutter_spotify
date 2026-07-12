
import 'package:flutter/material.dart';
import 'package:flutter_application_10/screens/welcome_screen.dart';

import 'package:flutter_application_10/core/constants/app_colors.dart';
import 'dart:async';



class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 3),(){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context)=>const WelcomeScreen(),
          ),
      );
    });
  }
 @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor:AppColors.background ,
     body: Center(
       child:Column(
       mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Image(image: AssetImage('assets/images/spotify2_logo.png',),
         height: 150,
         width: 150,
         ),
          ],
       ),
     ),
    );
  }
}

