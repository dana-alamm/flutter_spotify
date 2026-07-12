import 'package:flutter/material.dart';
import 'package:flutter_application_10/core/constants/app_colors.dart';
import 'package:flutter_application_10/widgets/build_crads.dart';
import 'package:flutter_application_10/widgets/custom_bottom_nav_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {

     int _selectedIndex=1;

    final List<Map<String, dynamic>> topGenresData = [
      {'title': 'Pop', 'color': const Color(0xFF8D67AB)},
      {'title': 'Bollywood', 'color': const Color(0xFF8F1931)},
      {'title': 'Hip-Hop', 'color': const Color(0xFF537AA1)},    
  {'title': 'Dance & Electronic', 'color': const Color(0xFFAF2896)},  
  {'title': 'Indie', 'color': const Color(0xFFE91429)},      
  {'title': 'R&B', 'color': const Color(0xFFDC143C)},       
  {'title': 'Afro', 'color': const Color(0xFFBC5900)},       
  {'title': 'Latin', 'color': const Color(0xFFE1118C)},
      
    ];
    final List<Map<String, dynamic>> browseAllData = [
  {'title': 'Podcasts', 'color': const Color(0xFFE54300)},
  {'title': 'New\nReleases', 'color': const Color(0xFFE8115B)},
  {'title': 'Charts', 'color': const Color(0xFF8D67AB)},
  {'title': 'Concerts', 'color': const Color(0xFF1E3264)},
  {'title': 'Made for\nYou', 'color': const Color(0xFF1E3264)},
  {'title': 'At Home', 'color': const Color(0xFF477A91)},
  {'title': 'Live Events', 'color': const Color(0xFF7358FF)},  
  {'title': 'K-Pop', 'color': const Color(0xFF148A08)},      
  {'title': 'Hip-Hop', 'color': const Color(0xFFBA5D07)},     
  {'title': 'Rock', 'color': const Color(0xFFE91429)},        
  {'title': 'Discover', 'color': const Color(0xFFE1118C)},    
  {'title': 'Gaming', 'color': const Color(0xFF8C7FF2)},      
  {'title': 'Workout', 'color': const Color(0xFF777777)},     
  {'title': 'Chill', 'color': const Color(0xFFD84000)},
];
    return Scaffold(
    backgroundColor: AppColors.background,
    extendBody: true,
   
    body: SafeArea(
      bottom: false,
      child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowIndicator(); 
            return true;
          },
      child: SingleChildScrollView(
       // physics: const ClampingScrollPhysics(),
        physics: const AlwaysScrollableScrollPhysics(), 
        child: Padding(
         padding: const EdgeInsets.only(
                left: 16.0,   
                right: 16.0,  
                top: 45.0,    
                bottom: 20.0, 
              ),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Padding(padding:EdgeInsets.all(12),
              // Padding(padding: EdgeInsets.only(left:12,top:20),
              // child: Row(
                // children: [
                  Text('Search',
                  style: TextStyle(
                    fontFamily: 'Gotham',
                    color:Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 42,
                    letterSpacing: -3.36,
                    height: 1,
                  ),
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    width: double.infinity,
                    height: 63,
                    
                    child:TextField(
                      style:TextStyle(
                        fontFamily: 'Gotham',
                        color: Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.15,

                      ),
                      decoration: InputDecoration(
                        
                        hintText: 'Artists, songs, or podcasts',
                         hintStyle: TextStyle(color:Color(0xFF525252),fontSize: 19),
                         fillColor: Colors.white,
                         filled: true,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
                        prefixIcon: Icon(Icons.search,color: Colors.black87, size: 40),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,

                        ),
                       
                      ),
                    ),
                  ),
                  const SizedBox(height: 24,),

                  const Text(
                    'Your top genres',
                    style: TextStyle(
                      fontFamily: 'Gotham',
                      fontWeight: FontWeight.w700,
                      color:Colors.white,
                      fontSize: 20,
                     letterSpacing: -0.6,
                    ),
                  ),
                  SizedBox(height: 16,),

                SizedBox(
                  height: 130,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: topGenresData.length,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.only(right:16.0),
                        child:SizedBox(
                          width: 184,
                          child: BuildCrads(
                            title: topGenresData[index]['title'],
                             backgroundColor: topGenresData[index]['color']),
                        ),
                        );

                    }
                    ),
                ),
                SizedBox(height: 24,),
                const Text(
                  'Browse all',
                  style: TextStyle(
                     fontFamily: 'Gotham',
                      fontWeight: FontWeight.w700,
                      color:Colors.white,
                      fontSize: 20,
                     letterSpacing: -0.6,
                  ),),
                  SizedBox(height: 16,),

                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    //physics: const AlwaysScrollableScrollPhysics(), 
                  // padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  padding:EdgeInsets.zero,
                   itemCount: browseAllData.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:2,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 18.0,
                      childAspectRatio: 1.45,
                      
                      ),
                     itemBuilder: (context,index){
                      return BuildCrads(
                        title: browseAllData[index]['title'],
                        backgroundColor: browseAllData[index]['color'],
                        );
                     })
          

                ],

              ),
              ),

           // ],
          ),
          ),
      ),
     // ),
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