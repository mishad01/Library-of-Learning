public class Main {
    public static void main(String[] args) {
        SmartKitchen ob = new SmartKitchen();
//        ob.getDishWasher().setHasWorkTodo(true);
//        ob.getDishWasher().doDishes();
//        ob.getBrewMaster().setHasWorkTodo(true);
//        ob.getBrewMaster().brewCoffee();
//        ob.getIceBox().setHasWorkTodo(true);
//        ob.getIceBox().orderFood();
        ob.setKitchenState(true,false,true);
        ob.doKitchenWork();

    }


}