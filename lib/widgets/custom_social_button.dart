import 'package:flutter/material.dart';

class CustomSocialButton extends StatelessWidget {
 final Widget icon;
 final String text;
 final VoidCallback onPressed;
 
 const CustomSocialButton({
  super.key,
  required this.icon,
  required this.text,
  required this.onPressed,

 });

  @override
  Widget build(BuildContext context) {
     return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.white, width: 1),
          shape: const StadiumBorder(),
        ),
      onPressed: onPressed,
        child: Row(
          children: [
            icon,
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 21,
                  height: 2.47,
                  letterSpacing: -0.63,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}