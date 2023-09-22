public class Car {
    private String description;

    public Car(String description) {
        this.description = description;
    }

    public void startEngine(){
        System.out.println("Car -> Start Enginee");
    }
    public void drive(){
        System.out.println("Driving, Type is " + getClass().getSimpleName()); //getClass().getSimpleName() its show us the class name
        runEngine();
    }
    protected void runEngine(){
        System.out.println("Car -> Engine is running");

    }
}
class GasPoweredCar extends Car{
    private double avgKmPerLiter;
    private int cylinder;

    public GasPoweredCar(String description){
        super(description);
    }

    public GasPoweredCar(String description, double avgKmPerLiter, int cylinder) {
        super(description);
        this.avgKmPerLiter = avgKmPerLiter;
        this.cylinder = cylinder;
    }

    @Override
    public void startEngine() {
        System.out.printf("GAS -> ALL %d cylinder are fired up, Ready! %n",cylinder);
    }

    @Override
    protected void runEngine() {
        System.out.printf("GAS -> Usages exceeds the average %.2f %n",avgKmPerLiter);
    }
}
class ElectricalCar extends Car{
    private double avgKmPerCharge;
    private int batterySize;

    public ElectricalCar(String description){
        super(description);
    }

    public ElectricalCar(String description, double avgKmPerCharge, int batterySize) {
        super(description);
        this.avgKmPerCharge = avgKmPerCharge;
        this.batterySize = batterySize;
    }

    @Override
    public void startEngine() {
        System.out.printf("Bev -> switch %d kwh battery on, Ready! %n", batterySize);
    }

    @Override
    protected void runEngine() {
        System.out.printf("Bev -> Usages under the average %.2f %n", avgKmPerCharge);
    }
}

class HybrideCar extends Car{
    private double avgKmPerLiter;
    private int cylinder;
    private int batterySize;


    public HybrideCar(String description){
        super(description);
    }

    public HybrideCar(String description, double avgKmPerLiter, int cylinder,int batterySize) {
        super(description);
        this.avgKmPerLiter = avgKmPerLiter;
        this.cylinder = cylinder;
        this.batterySize = batterySize;
    }

    @Override
    public void startEngine() {
        System.out.printf("Hybrid -> ALL %d cylinder are fired up, Ready! %n",cylinder);
        System.out.printf("Hybrid -> switch %d kwh battery on ,Ready !%n",batterySize);
    }

    @Override
    protected void runEngine() {
        System.out.printf("Hybrid -> Usages below the average %.2f %n",avgKmPerLiter);
    }
}


