import java.sql.SQLOutput;
import java.util.Scanner;
public class  Main {
    public static void main(String[] args) {
        int [] marks = new int [3];
        marks[0] = 7;
        marks[1]= 56;
        marks[2] = 6;

        Scanner cin = new Scanner(System.in);
        System.out.println("Enter the array index: ");
        int indd = cin.nextInt();

        System.out.println("Enter the number you want to divide the value with : ");
        int num = cin.nextInt();
        try{

            System.out.println("The value at array index enter is "+marks[indd]);
            System.out.println("The value of array divided by "+ marks[indd]/num);
        }
        catch(ArithmeticException e){
            System.out.println("Some ArithmeticException occured!! ");
            System.out.println(e);
        }
        catch(ArrayIndexOutOfBoundsException e){
            System.out.println("Some exception ArrayIndexOutOfBoundsException occurd!! ");
            System.out.println(e);
        }
        catch(Exception e){
            System.out.println("Some exception occured!! ");
            System.out.println(e);
        }
    }

}
