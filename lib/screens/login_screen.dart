import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_10/core/services/SharedPrefsServices.dart';
import 'package:flutter_application_10/screens/home_screen.dart';
import 'package:flutter_application_10/screens/signup_screen.dart';
import 'package:flutter_application_10/core/constants/app_colors.dart';
//import 'package:flutter_application_10/widgets/custom_social_button.dart';
import 'package:flutter_application_10/widgets/spotify_header.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState>_formkey=GlobalKey<FormState>();
  final TextEditingController _usernameController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  bool _isLoading=false;
  bool _isobscure=true;

  // void _handleLogin() async{
  //   if(_formkey.currentState!.validate()){
  //     setState(() {
  //       _isLoading=true;
  //     });
  //     await Future.delayed(const Duration(seconds: 2));
  //     if(mounted){
  //       setState(() {
  //         _isLoading=false;
  //       });
      
  //     Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(builder: (context)=>HomeScreen()),
  //     );
  //     }
  //   }
  // }

  void _handleLogin()async{
    if(_formkey.currentState!.validate()){
      setState(() {
        _isLoading=true;
      });
      try {
        UserCredential userCredential=await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _usernameController.text.trim(), 
          password: _passwordController.text.trim(),
          );

          
          await SharedPrefsServices.saveData(key:'user_email',value: _usernameController.text.trim());
         await SharedPrefsServices.saveData(key: 'isLoggedIn',value: true);
          if(mounted){
            setState(() {
              _isLoading=false;
            });
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomeScreen(),)
            );
          }
      } on FirebaseAuthException catch(e){
        if(mounted){
          setState(() {
            _isLoading=false;
          });
          String errorMessage = 'An error occurred. Please try again.';
        if (e.code == 'user-not-found') {
          errorMessage = 'No user found for that email. Sign up instead! 😉';
        } else if (e.code == 'wrong-password') {
          errorMessage = 'Wrong password provided. Please try again.';
        } else if (e.code == 'invalid-email') {
          errorMessage = 'The email address is badly formatted.';
        }
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage,style: const TextStyle(color: Colors.white)),
            backgroundColor: Colors.redAccent,
            behavior: SnackBarBehavior.floating,
            ),
        );
        }
      }catch(e){
        if (mounted) {
        setState(() { _isLoading = false; });
      }
      }
    }
  }
  @override
  void dispose(){
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body:SafeArea(
        child:Padding(
          padding: const EdgeInsets.symmetric(horizontal:24.0,vertical: 30.0 ),
          child:Form(
            key:_formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                const SpotifyHeader(),
               
                const SizedBox(height: 30,),

                TextFormField(
                  controller: _usernameController,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    letterSpacing: -0.15,
                  ),
                

               
                    decoration: InputDecoration(
                      
                      hintText: 'username',
                      hintStyle: TextStyle(color:Colors.grey[600],fontSize: 14),
                      fillColor: Colors.white,
                      filled:true,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16,vertical: 0),
                      errorStyle: const TextStyle(color:Colors.redAccent),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.grey, width: 0.5),
                      ),
            
                    ),
                    validator: (value) {
                      if(value==null||value.trim().isEmpty){
                        return'please enter a username';
                      }
                      return null;
                    },
                  ),
                  
                
                const SizedBox(height: 10,),
              
                
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _isobscure,
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
                      errorStyle: const TextStyle(color:Colors.redAccent),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color:Colors.grey,width: 0.5),
                      ),
                      suffixIcon: GestureDetector(
                      child: Icon(_isobscure?Icons.visibility_off_outlined : Icons.visibility_outlined,
                      color:Colors.grey[600],
                      ),
                    onTap: () {
                    setState(() {
                      _isobscure=!_isobscure;
                    });
                    }, 
                    ),
                    ),
                    validator: (value) {
                      if(value==null||value.isEmpty){
                        return "please enter your password";
                      }
                      // if(value.length<8){
                      //   return "Password must be at least 8 characters";
                      // }
                      //final RegExp passwordRegex=RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');

                      // if(!passwordRegex.hasMatch(value)){
                      //   return 'Must include letters, numbers, and special characters (e.g. @, #, !)';
                      // }
                      return null;
                    },
                    
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
                 onPressed: _isLoading?null:_handleLogin,
                 child:_isLoading
                 ?const SizedBox(
                  height: 24,
                  width: 24,
                  child:CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color:AppColors.background,
                  ),
                 )
                  : Text('Log in',style: TextStyle(
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
                onPressed: (){
                  Navigator.of(context).pushReplacement((
                    MaterialPageRoute(
                      builder: (context) => const SignupScreen(),)));
                },
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
            ),
          )
          ) )
    );
  }
}