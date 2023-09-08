import java.util.ArrayList;
import java.util.List;
import java.util.Random;

class FootballTeam {
    String name;
    String city;
    List<String> players;

    public FootballTeam(String name, String city, List<String> players) {
        this.name = name;
        this.city = city;
        this.players = players;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public List<String> getPlayers() {
        return players;
    }

    public void setPlayers(List<String> players) {
        this.players = players;
    }
    void add_player(String player) {
        players.add(player);
    }
    void remove_player(String player) {
        players.remove(player);
    }

}
class Hometeam extends FootballTeam {
    String stadiumName; // variable names should use camelCase
    String coachName;

    public Hometeam(String name, String city, List<String> players, String stadiumName, String coachName) {
        super(name, city, players); // call parent class constructor with parameters
        this.stadiumName = stadiumName;
        this.coachName = coachName;
    }

    // getters and setters
    public String getStadiumName() {
        return stadiumName;
    }

    public void setStadiumName(String stadiumName) {
        this.stadiumName = stadiumName;
    }

    public String getCoachName() {
        return coachName;
    }

    public void setCoachName(String coachName) {
        this.coachName = coachName;
    }
    public void assignCoach(String coachName) {
        setCoachName(coachName);
    }
}
class football{
    Hometeam hometeam;
    String date;
    String location;

    public football(Hometeam hometeam, String date, String location) {
        this.hometeam = hometeam;
        this.date = date;
        this.location = location;
    }

    public Hometeam getHometeam() {
        return hometeam;
    }

    public void setHometeam(Hometeam hometeam) {
        this.hometeam = hometeam;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }
    public String playmatch(){
        Random r = new Random();
        int homeGoals = r.nextInt(4);
        int awayGoals = r.nextInt(4);
        String result = hometeam.getName() + " " + homeGoals + " - " + awayGoals + " " + hometeam.getCity();
        return "Final score: " + result;
    }
}


public class Main {
    public static void main(String[] args) {
        // Create players list
        List<String> players = new ArrayList<String>();
        players.add("John");
        players.add("Mark");
        players.add("Paul");

        // team and set attributes
        Hometeam homeTeam = new Hometeam("FC Barcelona", "Barcelona", players, "Camp Nou", "Pep Guardiola");



        // football match and set attributes
        football match = new football(homeTeam, "2023-04-24", "Camp Nou");

        // match and get score
        String score = match.playmatch();
        System.out.println(score);

        // attributes of home team
        System.out.println("Home Team: " + homeTeam.getName() + " (" + homeTeam.getCity() + ")");
        System.out.println("Stadium: " + homeTeam.getStadiumName());
        System.out.println("Coach: " + homeTeam.getCoachName());
        System.out.println("Players before add: " + homeTeam.getPlayers());

        homeTeam.add_player("Messi");
        homeTeam.add_player("Neymar");
        System.out.println("Players: " + homeTeam.getPlayers());

        // attributes of football match
        System.out.println("Match Date: " + match.getDate());
        System.out.println("Location: " + match.getLocation());
    }

}
