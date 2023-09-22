public class Main {
    public static void main(String[] args) {
        A ob1 = new A(10,"Mishad");
        B ob2 = new B(20,"Anu",221000);


        D ob3 = new D(ob2);
        ob3.getB().Num();



    }
}