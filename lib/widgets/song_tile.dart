import 'package:flutter/material.dart';

class SongTile extends StatelessWidget {
  final String image;
  final String title;
  final String singer;
  final bool hasLyrics;

  const SongTile({
    super.key,
    required this.image,
    required this.title,
    required this.singer,
     this.hasLyrics=false,

    });
   

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
      child:Row(
        children: [
          Container(
           width: 62.08,
           height: 66.6,
           decoration: BoxDecoration(
            image: DecorationImage(
              image:AssetImage(image),
              fit: BoxFit.cover,
              ),
           ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center, 
            
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Gotham',
                    color:Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.4,
                    
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if(hasLyrics)...[
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                        decoration: BoxDecoration(
                          color: Color(0xFFC4C4C4),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child:const Text(
                          'LYRICS',
                          style: TextStyle(
                            fontFamily: 'Gotham',
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.6,

                          ),
                        ),
                      ),
                      const SizedBox(width: 6,),
                      Expanded(
                        child: Text(
                          singer,
                          style: TextStyle(
                            fontFamily: 'Gotham',
                            color:Color(0xFFA7A7A7),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.6,
                          ),
                          maxLines: 1,
                         overflow: TextOverflow.ellipsis,
                        ),

                        ),
                    ]
                  ],
                  ),
              ],
            ),
            

            ),
            IconButton(
            onPressed: (){},
             icon: Icon(Icons.more_vert, 
             color:Colors.white),
             ),
        ],
      ),
      );
  }
}