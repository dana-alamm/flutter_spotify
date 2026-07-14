class SongModel {
  final String title;
  final String artist;
  final String coverUrl;
  final bool hasLyrics;
  final String audioURL;
  bool isFavorite;
  
  SongModel({
    required this.title,
    required this.artist,
    required this.coverUrl,
    required this.hasLyrics,
    required this.audioURL,
    this.isFavorite = false,
  });
}