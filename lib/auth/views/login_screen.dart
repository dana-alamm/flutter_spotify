import 'package:flutter/material.dart';
import 'package:flutter_application_10/core/constants/app_colors.dart';
import 'package:flutter_application_10/widgets/custom_social_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body:SafeArea(
        child:Padding(
          padding: const EdgeInsets.symmetric(horizontal:24.0,vertical: 30.0 ),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset('assets/images/white_spofity.png',
              height: 90,
              width: 90,),
              const SizedBox(height: 30,),
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
              const SizedBox(height: 30,),
              SizedBox(
                width: double.infinity,
                height: 44,
                child: TextField(
                  style: TextStyle(color: Colors.black,
                  fontSize: 14,
                  letterSpacing: -0.15
                  ),
                  decoration: InputDecoration(
                    
                    hintText: 'username',
                    hintStyle: TextStyle(color:Colors.grey[600],fontSize: 14),
                    fillColor: Colors.white,
                    filled:true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16,vertical: 0),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.grey, width: 0.5),
                    ),

                  ),
                ),
                
              ),
              const SizedBox(height: 10,),
              SizedBox(
                width: double.infinity,
                height: 44,
                child:TextField(
                  obscureText: true,
                  style: TextStyle(color:Colors.black,
                  fontSize: 14,
                  letterSpacing: -0.15
                  ),
                  decoration: InputDecoration(
                    hintText: 'password',
                    hintStyle: TextStyle(color:Colors.grey[600],fontSize: 14),
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16,vertical: 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color:Colors.grey,width: 0.5),
                    ),
                  
                  ),
                  
                ),
                
              ),
              SizedBox(height: 20,),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  style:TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(0,0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: (){}, 
                  child: Text('Forgot password?',
                  style:TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    height: 1.0,
                    letterSpacing: 0.15,
                    color: AppColors.primaryGreen,
                   
                  ) ,)),
              ),
              SizedBox(height:30),
             SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style:ElevatedButton.styleFrom(
                  backgroundColor:AppColors.primaryGreen,
                  shape: const StadiumBorder(),
                  elevation: 0,
                ),
                onPressed: (){}, 
                child: Text('Log in',style: TextStyle(
                  fontFamily: 'Poppins',
                    color: AppColors.background,
                      fontWeight: FontWeight.w700,
                      fontSize: 21,
                      height: 2.47,
                      letterSpacing: -0.63,
                ),)),
             ),
             SizedBox(height: 70,),
             TextButton(
              onPressed: (){},
               child: const Text(
                'Sign Up.',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color:Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.3,
                  fontSize: 21,

                ),
               ),
               ),
               const Spacer(),
            ],
          )
          ) )
    );
  }
}