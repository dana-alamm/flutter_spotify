import 'package:flutter/material.dart';
import 'package:flutter_application_10/screens/home_screen.dart';
import 'package:flutter_application_10/screens/playlist_screen.dart';
import 'package:flutter_application_10/screens/search_screen.dart';

class customBottonNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>onTap;

  const customBottonNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
        
        height: 95, 
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,    
            end: Alignment.bottomCenter,  
            colors: [
              Colors.transparent,                  
              Colors.black.withOpacity(0.6),     
              const Color(0xFF121212),            
            ],
            stops: const [0.0, 0.4, 1.0], 
          ),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,     
            highlightColor: Colors.transparent,  
            canvasColor: Colors.transparent, 
          ),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            iconSize: 30.0,
            onTap: (index){
              if(index==currentIndex)return;
              if(index==0){
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                  (route) => false, 
                );
              }
              else if(index==1){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
              }
              else if(index==2){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>PlaylistScreen()));
              }
              else if(index==3){

              }
            },
            elevation: 0, 
            backgroundColor: Colors.transparent, 
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            selectedFontSize: 11,
            unselectedFontSize: 11,
            items: [
              const BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
              const BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
              const BottomNavigationBarItem(icon: Icon(Icons.library_music_outlined), label: 'Your Library'),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/prenium.png',
                  width: 30,
                  height: 30,
                ),
                label: 'Premium',
              )
            ],
          ),
        ),
      );
  }
}