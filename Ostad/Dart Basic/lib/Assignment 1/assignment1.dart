//Base class 'Media'
class Media{
  void play(){
    print('Playing Media...');
  }
}

//Derived class 'Song' inheriting from 'Media'
class Song extends Media{
  Song(this.artist);
  String artist;
  
  @override
  void play() {
    print('Playing song by $artist...');
  }
}

void main(){
  //Instance of Media
  Media media = Media();
  media.play();

  //Instance of Song
  Song song = Song('Pritom Hasan');
  song.play();
}