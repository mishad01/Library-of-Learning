public class Refrigerator {
    boolean hasWorkTodo;

    public void setHasWorkTodo(boolean hasWorkTodo) {
        this.hasWorkTodo = hasWorkTodo;
    }

    public void orderFood(){
        if(hasWorkTodo){
            System.out.println("Food is Ordering");
        }
    }
}
