//import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_10/core/constants/app_colors.dart';
import 'package:flutter_application_10/widgets/album_horizontal_list.dart';
import 'package:flutter_application_10/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter_application_10/widgets/home_section_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor:AppColors.background,
      extendBody: true,
      body:  Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end:Alignment(0.0,-0.2),
            
            colors: [
              Color(0xFF2E2E2E), 
              //const Color(0xFF1B1B1B),
              Color(0xFF121212), 
            ],
           // stops: const [0.0, 0.3,0.6],
           // stops: [0.0,1.0],

            ),
        ),
        child: SafeArea(
          bottom: false,
          
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top:16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 //Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0),
                 Padding(padding:EdgeInsets.only(left: 0.0, right: 8.0, top: 16.0), 
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     
                      const HomeSectionTitle(title: 'Made for you'),
                      Row(
                        children: [
                          IconButton(
                            onPressed: (){},
                             icon: const Icon(Icons.notifications_none_outlined, color: Colors.white, size: 26),
                             splashColor: Colors.transparent,
                             highlightColor: Colors.transparent,
                             ),
                             IconButton(
                              onPressed:(){} ,
                               icon: const Icon(Icons.history, color: Colors.white, size: 26),
                               splashColor: Colors.transparent,
                               highlightColor: Colors.transparent,
                               ),
                               IconButton(
                              icon: const Icon(Icons.settings_outlined, color: Colors.white, size: 26),
                              onPressed: () {},
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                            ),
                        ],
                      ),

                    ],
                  ),
                  ),
                 // const SizedBox(height: 16,),

                  const AlbumHorizontalList(
                    isDescriptionStyle: true,
                    images: [
                     'assets/images/ed_sheeran.jpg',
                     'assets/images/justin.jpg',
                    ],
                     titles:[
                      'Ed Sheeran, Katy Perry, Pitbull and more',
                      'Catch the Latest Playlist made just for you and i love jdahdahndkwadjcs'
                      

                     ], 
                     subtitles: []
                     ),
                   //  SizedBox(height: 10,),
                      
                    const HomeSectionTitle(title: 'Trending now'),

                   // const SizedBox(height: 16,),

                     const AlbumHorizontalList(
                      isDescriptionStyle: false,
                      images: [
                        'assets/images/believer.jpg',
                        'assets/images/harleys.jpg',
                        'assets/images/cheap.jpg',
                      ],
                       titles: [
                        'Believer',
                        'Harley’s in Hawaii',
                        'Cheap Trills',
                       ],
                       subtitles: [
                        'Imagine Dragons',
                        'Katy Perry',
                        'Sia '
                       ]),

                      // const SizedBox(height: 10,),

                       const HomeSectionTitle(title: 'Top picks for you'),

                     //  const SizedBox(height: 16,),

                       const AlbumHorizontalList(
                        images: [
                          'assets/images/maroon.jpg',
                          'assets/images/katty_perry.jpg'
                        ],
                         titles: [
                          'Daily Mix 1',
                          'Discover Weekly'
                         ],
                          subtitles: [
                            'Your daily mixtape',
                            'Your Weekly mixTape'
                          ]),
                          const SizedBox(height: 150),

                       

                ],
              ),
              ),
          )
          ),
      ),
      
      bottomNavigationBar:customBottonNavBar(
        currentIndex: _selectedIndex, 
        onTap: (index){
          setState(() {
            _selectedIndex=index;
          });
        })
    );
    
  }
}