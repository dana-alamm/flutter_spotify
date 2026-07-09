import 'package:flutter/material.dart';
import 'package:flutter_application_10/core/constants/app_colors.dart';
import 'package:flutter_application_10/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter_application_10/widgets/song_tile.dart';

class PlaylistScreen extends StatefulWidget {
  const PlaylistScreen({super.key});

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  @override
  Widget build(BuildContext context) {
     int _selectedIndex=2;
    final List<Map<String,dynamic>>songsList=[
    {
     'title':'Alone',
     'singer': 'Alan Walker',
     'image':'assets/images/alone_poster.jpg',
     'hasLyrics':true,
    },
    {
    'title': 'Let me love you',
    'singer': 'Justin Bieber feat DJ Snake',
    'image': 'assets/images/let_me_love_u.jpg',
    'hasLyrics': true,
  },
  {
    'title': 'Ignite',
    'singer': 'Alan Walker',
    'image': 'assets/images/ignite.jpg',
    'hasLyrics': true,
  },
  {
    'title': 'Taki Taki',
    'singer': 'DJ Snake feat Selena Gomez',
    'image': 'assets/images/taki_taki.jpg',
    'hasLyrics': true,
  },
  {
    'title': 'Believer',
    'singer': 'Imagine Dragons',
    'image': 'assets/images/believer.jpg',
    'hasLyrics': true,
  },
  {
    'title': 'Blinding Lights',
    'singer': 'The Weeknd',
    'image': 'assets/images/Blinding_Lights.png',
    'hasLyrics': true,
  },
  {
    'title': 'Shape of You',
    'singer': 'Ed Sheeran',
    'image': 'assets/images/Shape_Of_You.jpg',
    'hasLyrics': false, 
  },
  
  {
    'title': 'Stay',
    'singer': 'The Kid LAROI & Justin Bieber',
    'image': 'assets/images/Stay.jpg',
    'hasLyrics': true,
  },
  {
    'title': 'Mockingbird',
    'singer': 'Eminem',
    'image': 'assets/images/mockingbird.jpg',
    'hasLyrics': true,
  },
  {
    'title': 'Another Love',
    'singer': 'Tom Odell',
    'image': 'assets/images/another_love.jpg',
    'hasLyrics': false,
  },
  {
    'title': 'Night Changes',
    'singer': 'One Direction',
    'image': 'assets/images/night_changes.jpg',
    'hasLyrics': true,
  },
 
    ];
    return Scaffold(
    backgroundColor: AppColors.background,
    extendBody: true,
    body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment(0.0, 0.6),
          colors: [ 
              Color(0xFF2E2E2E), 
              Color(0xFF121212),
          ],
              
               ),
      ),
      child:SafeArea(
        bottom: false,

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
               // SizedBox(height: 10,),
                Center(
                  child: Container(
                    width:253.56,
                    height: 286.1,
                    decoration: BoxDecoration(
                       boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          blurRadius: 15,
                          offset: const Offset(0, 10),
                        ),
                       ],
                       image: const DecorationImage(
                      image: AssetImage('assets/images/imagine_dragons.jpg'), 
                       fit: BoxFit.cover, 
            ),
                    ),
                  ),
                ),
                Positioned(
                left: 16,
               top: 0, 
              child: IconButton(
              padding: EdgeInsets.zero,
             constraints: const BoxConstraints(), 
             onPressed: () {
              Navigator.pop(context);
                    }, 
                    icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Tune in to Top Tracks from Imagine Dragons, Alan Walker and many more',
              style:TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15,
                color: Color(0xFFA8A8A8),
                fontWeight: FontWeight.w500,
                letterSpacing: -0.3,
              ) ,
            ),
            
            ),
            SizedBox(height: 12,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child:Row(
                children: [
                  Image.asset('assets/images/spotify2_logo.png',
                  width: 26,
                  height: 26,),
                  SizedBox(width: 8,),
                  Text(
                    'Spotify',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color:Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.6,
                    ),
                  )
                ],
              ),),
              const SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  '191,165 likes . 3h 45min',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xFFA8A8A8),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.2,
                  ),
                ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      IconButton(
                        
                        onPressed: (){}, 
                        padding: EdgeInsets.zero,
                        alignment: Alignment.topLeft,
                        
                        constraints: const BoxConstraints(),
                        icon:  Icon(
                          Icons.favorite_border,
                          size: 33,
                          weight: 28,
                          color: Colors.white,
                          

                        ),
                        ),
                        SizedBox(width: 20,),
                        IconButton(
                          onPressed: (){}, 
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          icon: Icon(
                            Icons.more_vert,
                            size:33,
                            weight: 28,
                            color:Colors.white,
                          ),),
                          
                          const Spacer(),
                          
                          GestureDetector(
                            onTap: () {
                              
                            },
                            child: Container(
                              width: 74.01,
                              height: 68.32,
                              decoration: BoxDecoration(
                                color:AppColors.primaryGreen,
                                shape: BoxShape.circle,
                              ),
                              child:Icon(
                                Icons.play_arrow,
                               color: Colors.black,     
                               size: 50,
                              ),
                            ),
                          ),
                    ],
                  ),
                  ),
                  SizedBox(height: 20,),

                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: songsList.length,
                    itemBuilder: (context,index){
                      return SongTile(
                        image: songsList[index]['image'],
                         title: songsList[index]['title'],
                          singer:songsList[index]['singer'],
                          hasLyrics: songsList[index]['hasLyrics'],
                          );
                    },
                    ),
                    const SizedBox(height: 32),
        
            ],
            
          ),
           
        ),
        
        ),
       
    ),
     bottomNavigationBar:customBottonNavBar(currentIndex: _selectedIndex,
         onTap: (index){
          setState(() {
            _selectedIndex=index;
          });
         })
    );
  }
}