import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
//        Movie theMovie = Movie.getMovie("Advanture","Star Wars");
//        theMovie.watchMovie();
//        Scanner s = new Scanner(System.in);
//        while(true){
//            System.out.println("Enter type (A for Afvanture,C for Comedy,S for Scinence Fiction");
//            String type = s.nextLine();
//            if("Qq".contains((type))){
//                break;
//            }
//            System.out.println("Enter Movie Title");
//            String title = s.nextLine();
//            Movie movie = Movie.getMovie(type,title);
//            movie.watchMovie();
//        }
        Movie movie = Movie.getMovie("A","Jaws");
        movie.watchMovie();
        Adventure jaws = (Adventure) Movie.getMovie("A","Jaws");
        jaws.watchMovie();
        Object comedy = Movie.getMovie("C","Airplane");
        Comedy comedyMovie = (Comedy) comedy;
        comedyMovie.watchComedy();
        var airplane = Movie.getMovie("A","Mishad");
        airplane.watchMovie();
        var plane = new Comedy("Airplane");
        plane.watchComedy();

    }
}