public class CoffeeMaker {
    boolean hasWorkTodo;

    public void setHasWorkTodo(boolean hasWorkTodo) {
        this.hasWorkTodo = hasWorkTodo;
    }

    public void brewCoffee(){
        if(hasWorkTodo){
            System.out.println("Coffee is making");
        }
    }

}
