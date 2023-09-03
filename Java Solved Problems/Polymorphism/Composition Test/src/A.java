public class A {
    int num;
    String name;

    public A(int num, String name) {
        this.num = num;
        this.name = name;
    }

    public int getNum() {
        return num;
    }

    public String getName() {
        return name;
    }
    public void Num() {
        if(num>0){
            System.out.println(num);
        }
        else{
            System.out.println(-1);
        }
    }
}
class B extends A{
    int roll;

    public B(int num, String name, int roll) {
        super(num, name);
        this.roll = roll;
    }

    public int getRoll() {
        return roll;
    }

    public void Num() {
        if(num>0){
            System.out.println(num);
        }
        else{
            System.out.println(-1);
        }
    }
}
