public class NextMain {
    public static void main(String[] args) {
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

        //Object unknownobject = Movie.getMovie("c","Airplane");
        Object unknownObject = Movie.getMovie("A", "Star Wars");
        if (unknownObject.getClass().getSimpleName() == "Comedy") {
            Comedy c = (Comedy) unknownObject;
            c.watchComedy();
        } else if (unknownObject instanceof Adventure add) {
            add.watchAdventure();
        }
        else if (unknownObject instanceof ScienceFiction syfy ) {
            syfy.watchScienceFiction();
        }
    }
}
