//An Special of class where we cant intialize
//We can create object of it 

abstract class BaseApiServices{
  void postApi(var data);
  void getApi();
}

class NetworkServicesApi extends BaseApiServices{
  String name;
  NetworkServicesApi(this.name);
  @override
  void postApi(var data)async{
    print("post api hit");
    await Future.delayed(Duration(seconds: 2));
    print("User Logged in");
    print(data['email']);
  }
  @override
  void getApi(){
    print("get api hit");
  }
}

void main(){
  NetworkServicesApi networkServicesApi = NetworkServicesApi("test");
  Map<String,String>data = {
    'email':'test@gmail.com',
    'password':'123123'
  };
  networkServicesApi.postApi(data);
}
