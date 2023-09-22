public class  Main {
    public static void main(String[] args) {
        int a = 6000;
        int b = 0;
        //Without try
        //int c = a/b;


        //with try
        try{
            int c = a/b;
            System.out.println("The result is "+c);
        }
        catch(Exception e){
            System.out.println("We failed to divide reason: ");
            System.out.println(e);
        }
    }

}
