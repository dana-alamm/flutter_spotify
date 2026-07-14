import 'package:flutter/material.dart';
import 'package:flutter_application_10/core/models/song_model.dart';
import 'package:flutter_application_10/screens/music_player_screen.dart';


class AlbumHorizontalList extends StatelessWidget {
  final List<String>images;
  final List<String>titles;
  final List<String>subtitles;
  final bool isDescriptionStyle;

  const AlbumHorizontalList({super.key,
  required this.images,
  required this.titles,
  required this.subtitles,
  this.isDescriptionStyle=false
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child:ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 16.0),
        itemCount:images.length,
        physics: ClampingScrollPhysics(),
        itemBuilder: (context,index){
          return GestureDetector(
           onTap: () {
             Navigator.push(context, MaterialPageRoute(
              builder: (context)=>MusicPlayerScreen(
                title: titles[index],
              singer: subtitles.isNotEmpty ? subtitles[index] : 'unknown singer',
              image: images[index], 
             selectedSong: SongModel(
             title: titles[index],
             artist: subtitles.isNotEmpty ? subtitles[index] : 'unknown singer',
             coverUrl: images[index],
            hasLyrics: true,
  ),
              ),
             ),
             );
           },
           child: Container(
            width: 174,
            margin: EdgeInsets.only(right:16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                 // borderRadius: BorderRadius.circular(4),
                  child:SizedBox(
                    width: 174,
                    height: 176,
                   child: Image.asset(
                    images[index],
                    fit:BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.music_note, color: Colors.grey, size: 40);
                        },
                   ),
                  ),
                ),
                SizedBox(height: 10,),
               
               if(isDescriptionStyle)...[
                Text(
                  titles[index],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.0,
                  ),
                ),
               ]else ...[
                Text(
                  titles[index],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'Gotham',
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.0,
                  ),
                ),
                const SizedBox(height: 4,),
                Text(
                  'Song • ${subtitles[index]}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'Gotham',
                    color:Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.0,
                  ),
                )

               ]
               
              ],
            ),
           ),
          );
        }

        
        )
    );
  }
}