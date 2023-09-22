public class Main extends java.lang.Object  {
    public static void main(String[] args) {
        Employee Anu = new Employee("Ananya","16/07/2000","01/01/2020");
        Employee Saif= new Employee("Saif","1/4/2001","01/01/2020");
        System.out.println(Anu);
        System.out.println("Age = "+Anu.getAge());
        System.out.println("Pay = "+Anu.collectPay());
        System.out.println(" ------------------------");
        System.out.println(Saif);
        System.out.println("Age = "+Saif.getAge());
        System.out.println("Pay = "+Saif.collectPay());
    }
}