import java.util.Scanner;
class addd{
    addd(int a,int b)
    {
        int sum;
        sum =a+b;
        System.out.println(sum);
    }
}
class Add{
    Add(int a,int b,int c)
    {
        int sum;
        sum=a+b+c;
        System.out.println(sum);
    }
}
public class Main {
    public static void main(String[] args) {
        Scanner cin = new Scanner(System.in);
        int x = cin.nextInt();
        int y = cin.nextInt();
        int z = cin.nextInt();
        addd a = new addd(x,y);
        Add b = new Add(x,y,z);
    }
}
class customer {
    int custid;
    int custage;
    String custname;

    customer(int id, int age, String name) {
        custid = id;
        custage = age;
        custname = name;
        void display() {
            System.out.println(custid + " " + custage + " " + custname);
            System.out.println(studentid + " " + studentage + " " + studentname);
        }



        class student {
            int studentid;
            int studentage;
            String studentname;

            student(int a, int b, String c) {
                studentid = a;
                studentage = b;
                studentname = c;
            }

            void display() {
                System.out.println(custid + " " + custage + " " + custname);
                System.out.println(studentid + " " + studentage + " " + studentname);
            }


            public static void main(String args[]) {
                customer c1 = new customer(20, 22, "Akash");
                student s1 = new student(30, 18, "Oney");
                c1.display();
                s1.display();
            }
        }
    }
}

