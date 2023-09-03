public class Employee extends Worker {
    private long employeId;
    private String hireDate;
    private static int employeno = 1;

    public Employee(String name, String birthDate, String hireDate) {
        super(name, birthDate);
        this.employeId = employeno++;
        this.hireDate = hireDate;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "employeId=" + employeId +
                ", hireDate='" + hireDate + '\'' +
                "} " + super.toString();
    }
}


