//Abstraction is basically hiding the complexity
//Without encapsulation data hiding is not possible

/*
Abstract=>
An abstract class is a class that cannot be instantiated on its own and is meant to be subclassed.
It may contain abstract methods, i.e., methods without a body, which must be implemented by any concrete subclasses.

Abstraction=>
Abstraction is a broader concept referring to the process of hiding the complex implementation details and showing only the essential features of an object.
It involves focusing on the essential qualities of an object while ignoring irrelevant details.

*/

class AcRemote{
  int _temp =0;

  void increaseTemp(){
    _awakeTheRemoteSystum();
  }

  void decrementTemp(){
    _awakeTheRemoteSystum();
  }

  void _awakeTheRemoteSystum(){
    print("Awake System");
    _callTheArduino();
  }

  void _callTheArduino(){
    print('execute command');
  }

  void _communicateWithAc(){
    print('Communicating with AC');
    _getReponse();
  }

  void _getReponse(){
    _temp = temp+1;
  }


  int get temp{
    return _temp;
  }
}