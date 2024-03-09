class Media{
  void play(){
    print('Playing Media...');
  }
}

class Song extends Media{
  Song(this.artist);
  String artist;
  
  @override
  void play() {
    print('Playing song by $artist...');
  }
}

void main(){
  Media media = Media();
  media.play();

  Song song = Song('Pritom Hasan');
  song.play();
}