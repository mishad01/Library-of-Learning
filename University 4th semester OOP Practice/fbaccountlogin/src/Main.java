class userinfo{
    String name;
    int password;

    public String getname()
    {
        return name;
    }

    public void setname(String name)
    {
        this.name=name;
    }

    public int getPassword() {
        return password;
    }

    public void setPassword(int password) {
        this.password = password;
    }
}
class step2 extends userinfo{
        String nam = "mishad";
        int pass = 1853152090;

        void login()
        {
            if(name==nam && password==pass)
            {
                System.out.println("Login Successfull");
            }
            else {
                System.out.println("Wrong ID or Password");
            }
        }


}
public class Main {
    public static void main(String[] args) {
        step2 a = new step2();
        a.setname("mishad");
        a.setPassword(185315200);
        a.login();
    }
}