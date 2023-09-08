public class DishWasher {


    boolean hasWorkTodo;

    public void setHasWorkTodo(boolean hasWorkTodo) {
        this.hasWorkTodo = hasWorkTodo;
    }

    public void doDishes(){
        if(hasWorkTodo){
            System.out.println("Dish is Washing");
        }
    }
}
