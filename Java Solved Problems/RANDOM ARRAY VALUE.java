//RANDOM ARRAY AT JAVA
import java.util.Random;

public class Main {
    public static void main(String[] args) {
        int []x = getRandomArray(10);
        for(int z :x){
            System.out.println(z);
        }

    }
    public static int[] getRandomArray(int len){
        Random random = new Random();
        int [] a = new int[len];
        for(int i = 0;i<len;i++){
            a[i]= random.nextInt(10);
        }
        return a;
    }
}
