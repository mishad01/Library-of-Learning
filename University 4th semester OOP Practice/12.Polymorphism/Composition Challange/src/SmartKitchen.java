import java.nio.charset.CoderResult;
import java.util.concurrent.CopyOnWriteArrayList;

public class SmartKitchen {
    public Refrigerator iceBox;
    private DishWasher dishWasher;
    private CoffeeMaker brewMaster;
    SmartKitchen(){
        iceBox = new Refrigerator();
        dishWasher =  new DishWasher();
        brewMaster = new CoffeeMaker();
    }

    public Refrigerator getIceBox() {
        return iceBox;
    }

    public DishWasher getDishWasher() {
        return dishWasher;
    }

    public CoffeeMaker getBrewMaster() {
        return brewMaster;
    }
    public void setKitchenState(boolean coffeeFlag,boolean fridgeFlag,boolean dishWasherFlag){
        brewMaster.setHasWorkTodo(coffeeFlag);
        iceBox.setHasWorkTodo(fridgeFlag);
        dishWasher.setHasWorkTodo(dishWasherFlag);
    }
    public void doKitchenWork(){
        brewMaster.brewCoffee();
        iceBox.orderFood();
        dishWasher.doDishes();
    }

}
