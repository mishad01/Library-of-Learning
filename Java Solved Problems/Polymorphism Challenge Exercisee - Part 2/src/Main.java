public class Main {
    public static void main(String[] args) {
        Car car = new Car("2002 Blue Ferrari 296 GTS");
        runRace(car);
        Car Ferrari = new GasPoweredCar("2002 Blue Ferrari 296 GTS",15.6,10);
        runRace (Ferrari);
        Car Tesla = new ElectricalCar(" TESLA",10,500);
        runRace (Tesla);



    }
    public static void runRace(Car car){
        car.startEngine();
        car.drive();
    }
}