// 
import 'package:flutter/material.dart';
import 'package:flutter_application_10/core/constants/app_colors.dart';
import 'package:flutter_application_10/core/models/song_model.dart';

class MusicPlayerScreen extends StatefulWidget {
  final SongModel selectedSong; 

  
  
  final String title;
  final String singer;
  final String image;
 
  const MusicPlayerScreen({
    super.key,
    required this.title,
    required this.singer,
    required this.image,
    required this.selectedSong,
  });

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  bool _isPlaying=false;
  bool _isFavorite=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF4D4D3A), 
              Color(0xFF121212), 
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              children: [
                
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context), 
                      icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 30),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'PLAYING FROM SEARCH',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white70,
                              fontWeight: FontWeight.w500,
                              fontSize: 11,
                              letterSpacing: 1,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '"${widget.title}" in Songs',
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {}, 
                      icon: const Icon(Icons.more_vert, color: Colors.white),
                    ),
                  ],
                ),
                
                const Spacer(),

                
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.width * 0.85,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage(widget.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                
                const Spacer(),

                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              widget.title,
                              style: const TextStyle(
                                fontFamily: 'Gotham',
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.5,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              widget.singer,
                              style: const TextStyle(
                                fontFamily: 'Gotham',
                                color: Color(0xFFA7A7A7),
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: Icon(_isFavorite?Icons.favorite_rounded:Icons.favorite_border_rounded,
                        color:_isFavorite?Colors.redAccent:Colors.grey[400],
                         size: 28),
                        onPressed: () {
                          setState(() {
                            _isFavorite=!_isFavorite;
                          });
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                _isFavorite?'Added to Liked Songs ❤️' : 'Removed from Liked Songs 💔',
                                style: const TextStyle(color:Colors.white),
                              ),
                              backgroundColor: Colors.grey[900],
                             duration: const Duration(seconds: 1),
                             behavior: SnackBarBehavior.floating,
                              ),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

               
                Column(
                  children: [
                    Transform.scale(
                      scaleX: 1.15,
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 6,
                          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Colors.white.withOpacity(0.2),
                          thumbColor: Colors.white,
                        ),
                        child: Slider(
                          value: 0.3,
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('1:23', style: TextStyle(color: Color(0xFFB8B7B5), fontSize: 15, fontFamily: 'Gotham', fontWeight: FontWeight.w500)),
                          Text('3:36', style: TextStyle(color: Color(0xFFB8B7B5), fontSize: 15, fontFamily: 'Gotham', fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

               
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.shuffle, color: Colors.white, size: 24),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.skip_previous, color: Colors.white, size: 36),
                        onPressed: () {},
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isPlaying=!_isPlaying;
                          });
                         
                        },
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color:_isPlaying?AppColors.primaryGreen:Colors.white,
                             shape: BoxShape.circle),
                          child:  Icon(
                            _isPlaying?Icons.pause:Icons.play_arrow,
                            color: Colors.black,
                             size: 36),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.skip_next, color: Colors.white, size: 36),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.repeat, color: Color(0xFFA7A7A7), size: 24),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.devices, color: Color(0xFFA7A7A7), size: 22),
                      Icon(Icons.share_outlined, color: Color(0xFFA7A7A7), size: 22),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}