import 'package:flutter/material.dart';
import 'package:flutter_application_10/core/constants/app_colors.dart';

import 'package:flutter_application_10/widgets/custom_social_button.dart'; 

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              
            
              Image.asset(
                'assets/images/white_spofity.png',
                height: 90,
                width: 90,
              ),
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
                  onPressed: () {},
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
                onPressed: () {},
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