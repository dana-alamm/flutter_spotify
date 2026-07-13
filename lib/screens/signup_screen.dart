import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_10/screens/home_screen.dart';
import 'package:flutter_application_10/core/constants/app_colors.dart';
import 'package:flutter_application_10/screens/login_screen.dart';
import 'package:flutter_application_10/widgets/spotify_header.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _isObscure = true;

  void _handleSignup() async {

  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  String email = _usernameController.text.trim();
  String password = _passwordController.text.trim();
    
    if (email.isEmpty) {
    _showErrorSnackBar('Please enter your email address.');
    return;
  }
  if (email.contains('..')) {
    _showErrorSnackBar('Analysis: Email contains consecutive dots (..). Please fix it.');
    return;
  }
  final RegExp emailRegex = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,4}$');
  if (!emailRegex.hasMatch(email)) {
    _showErrorSnackBar('Analysis: Invalid email format. Ensure one "@" and a single dot.');
    return;
  }

  
  if (password.isEmpty) {
    _showErrorSnackBar('Please enter your password.');
    return;
  }
  if (password.length < 8) {
    _showErrorSnackBar('Analysis: Password is too short! It must be at least 8 characters.');
    return;
  }
  final RegExp letterAndDigit = RegExp(r'(?=.*[A-Za-z])(?=.*\d)');
  if (!letterAndDigit.hasMatch(password)) {
    _showErrorSnackBar('Analysis: Missing pieces! You must include both letters and numbers.');
    return;
  }
  final RegExp specialChar = RegExp(r'(?=.*[@$!%*?&])');
  if (!specialChar.hasMatch(password)) {
    _showErrorSnackBar('Analysis: Security risk! Add at least one special character (e.g., @, #, !).');
    return;
  }

 
  setState(() {
    _isLoading = true;
  });

  try {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (mounted) {
      setState(() { _isLoading = false; });
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  } on FirebaseAuthException catch (e) {
    if (mounted) {
      setState(() { _isLoading = false; });
      
    
      String serverMessage = 'An error occurred. Please try again.';
      if (e.code == 'email-already-in-use') {
        serverMessage = 'Firebase: This account already exists. Try logging in! 😉';
      } else if (e.code == 'invalid-email') {
        serverMessage = 'Firebase: The email address is badly formatted.';
      }
      _showErrorSnackBar(serverMessage);
    }
  } catch (e) {
    if (mounted) {
      setState(() { _isLoading = false; });
    }
  }
}


void _showErrorSnackBar(String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message, style: const TextStyle(color: Colors.white, fontSize: 13)),
      backgroundColor: Colors.redAccent,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 4), 
    ),
  );
}

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
          child: Form(
            key: _formkey, 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                const SpotifyHeader(),
                const SizedBox(height: 30),
                
             
                TextFormField(
                  controller: _usernameController,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    letterSpacing: -0.15,
                  ),
                  decoration: InputDecoration(
                    hintText: 'username (email)',
                    hintStyle: TextStyle(color: Colors.grey[600], fontSize: 14),
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    errorStyle: const TextStyle(color: Colors.redAccent, fontSize: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.grey, width: 0.5),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter a username';
                    }
                   
                    final RegExp emailRegex = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,4}$');
                    if (!emailRegex.hasMatch(value.trim())) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                
                const SizedBox(height: 15),
                
                
                TextFormField(
                  controller: _passwordController,
                  obscureText: _isObscure,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    letterSpacing: -0.15,
                  ),
                  decoration: InputDecoration(
                    hintText: 'password',
                    hintStyle: TextStyle(color: Colors.grey[600], fontSize: 14),
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    errorStyle: const TextStyle(color: Colors.redAccent, fontSize: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.grey, width: 0.5),

                      
                    ),
                    suffixIcon: GestureDetector(
                      child: Icon(_isObscure?Icons.visibility_off_outlined : Icons.visibility_outlined,
                      color:Colors.grey[600],
                      ),
                    onTap: () {
                    setState(() {
                      _isObscure=!_isObscure;
                    });
                    }, 
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password";
                    }
                    if (value.length < 8) {
                      return "Password must be at least 8 characters";
                    }
                    
                    final RegExp passwordRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
                    if (!passwordRegex.hasMatch(value)) {
                      return 'Must include letters, numbers, and special characters (e.g. @, #, !)';
                    }
                    return null;
                  },
                ),
                
                const SizedBox(height: 20),
                
                // Align(
                //   alignment: Alignment.centerRight,
                //   child: TextButton(
                //     style: TextButton.styleFrom(
                //       padding: EdgeInsets.zero,
                //       minimumSize: const Size(0, 0),
                //       tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //     ),
                //     onPressed: () {}, 
                //     child: Text(
                //       'Forgot password?',
                //       style: TextStyle(
                //         fontFamily: 'Poppins',
                //         fontWeight: FontWeight.w500,
                //         fontSize: 12,
                //         height: 1.0,
                //         letterSpacing: 0.15,
                //         color: AppColors.primaryGreen,
                //       ),
                //     ),
                //   ),
                // ),
                
                const SizedBox(height: 30),
                
                
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryGreen,
                      shape: const StadiumBorder(),
                      elevation: 0,
                    ),
                    onPressed: _isLoading ? null : _handleSignup,
                    child: _isLoading
                        ? const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.5,
                              color: AppColors.background, 
                            ),
                          )
                        : const Text(
                            'Sign Up',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: AppColors.background,
                              fontWeight: FontWeight.w700,
                              fontSize: 21,
                              letterSpacing: -0.63,
                            ),
                          ),
                  ),
                ),

                const SizedBox(height: 20),
                
               
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.grey[400],
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'log in',
                        style: TextStyle(
                           fontFamily: 'Poppins',
                          color: AppColors.primaryGreen,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      )
                    ],
                  ),
                
                ),
                
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}