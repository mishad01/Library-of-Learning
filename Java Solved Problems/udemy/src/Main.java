import java.util.*;
public class Main {
    public static void main(String[] args) {
        Scanner cin = new Scanner(System.in);
        String n = cin.nextLine();


        switch (n) {
            case "January", "February","March"-> System.out.println("It's in one");
            case "April","May","June"-> System.out.println("It's in two");
            default -> System.out.println("It's in three");
        }
    }
}