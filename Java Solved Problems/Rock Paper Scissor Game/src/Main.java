import java.util.Random;
import java.util.Scanner;
public class Main {
    public static void main(String[] args) {

        Scanner cin = new Scanner(System.in);
        System.out.println("0 for ROCK, 1 for PAPER, 2 for SCICSSOR");
        int xx = 5;
        while(true) {
            int m = cin.nextInt();


            Random random = new Random();
            int c = random.nextInt(3);


            if (m == c) {
                System.out.println("DRAW");
            } else if (c == 0 && m == 2 || c == 1 && m == 2 || c == 2 && m == 0) {
                System.out.println("Computer Win!");
            }
            else if(m>2) {
                System.out.println("Wrong Input");
            }
            else {
                System.out.println("You Win!");
            }
            //System.out.println("Computer Choice: "+c);
            if (m == 0) {
                System.out.println("My Choice: ROCK");
            } else if (m == 1) {
                System.out.println("My Choice: PAPER");
            } else if (m == 2) {
                System.out.println("My Choice: SCICSSOR");
            }
//            else if (m > 2) {
//                System.out.println("Wrog Input");
//            }
            if (c == 0) {
                System.out.println("Computer Choice: ROCK");
            } else if (c == 1) {
                System.out.println("Computer Choice: PAPER");
            } else if (c == 2) {
                System.out.println("Computer Choice: SCICSSOR");
            }
            else if (c == 2) {
                System.out.println("Computer Choice: SCICSSOR");
            }
        }


    }
}