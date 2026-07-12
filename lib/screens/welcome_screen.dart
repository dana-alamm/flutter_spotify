import 'package:flutter/material.dart';
import 'package:flutter_application_10/screens/login_screen.dart';
import 'package:flutter_application_10/screens/signup_screen.dart';
import 'package:flutter_application_10/core/constants/app_colors.dart';

import 'package:flutter_application_10/widgets/custom_social_button.dart';
import 'package:flutter_application_10/widgets/spotify_header.dart'; 

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              
              const SpotifyHeader(),
              
             const SizedBox(height: 40),

             
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryGreen,
                    shape: const StadiumBorder(),
                    elevation: 0,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignupScreen()));
                  },
                  child: const Text(
                    'Sign up free',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: AppColors.background,
                      fontWeight: FontWeight.w700,
                      fontSize: 21,
                      height: 2.47,
                      letterSpacing: -0.63,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),

            
              CustomSocialButton(
                icon: const Icon(Icons.phone_android_rounded, color: Colors.white, size: 32),
                text: 'Continue with phone number',
                onPressed: () {},
              ),
              const SizedBox(height: 12),

             
              CustomSocialButton(
                icon: Image.asset('assets/images/google_logo.png', height: 20),
                text: 'Continue with Google',
                onPressed: () {},
              ),
              const SizedBox(height: 12),

            
              CustomSocialButton(
                icon: Image.asset('assets/images/facebook_logo.png', height: 20),
                text: 'Continue with facebook',
                onPressed: () {},
              ),
              const SizedBox(height: 20),

           
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LoginScreen(),)
                    );
                },
                child: const Text(
                  'Log in',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 21,
                    height: 2.47,
                    letterSpacing: -0.63,
                  ),
                ),
              ),
              
              const Spacer(),
            ],
            
          ),
        ),
      ),
    );
  }
}