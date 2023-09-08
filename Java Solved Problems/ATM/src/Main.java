class userinfo{
    int id =221000412;
    int pass=1234;

}
class login extends userinfo {
    int logg = 0;
    login(int id1,int pass1)
    {
        if(id==id1 && pass ==pass1 )
        {
            System.out.println("Login Successful");
            logg = logg++;
        }
        else
        {
            System.out.println("Login Failed");
        }
    }
}
class accountInfo extends login{

}
public class Main {
    public static void main(String[] args) {
        System.out.println("Hello world!");
    }
}