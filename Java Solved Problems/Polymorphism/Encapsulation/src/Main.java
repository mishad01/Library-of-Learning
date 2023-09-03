class Printer{
    private int tonerLevel;
    private int pagesPrinted;
    private boolean duplex;

    public Printer(int tonerLevel, boolean duplex) {
        this.tonerLevel = (tonerLevel>=0 && tonerLevel <=100 ) ? tonerLevel : -1;
        this.duplex = duplex;
    }
    public int  addToner(int tonerAmount){
        int tempAmount = tonerAmount + tonerLevel;
        if(tempAmount>0 || tempAmount<=100)
        {
            return -1;
        }
        tonerLevel = tonerAmount + tonerLevel;
        return tonerLevel;
    }
}
public class Main {
    public static void main(String[] args) {
        System.out.println("Hello world!");
    }
}