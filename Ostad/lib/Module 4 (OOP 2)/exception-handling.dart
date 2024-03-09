//Exception Handling
//Try-Catch
//Throws

//try, catch, throw
/*Try Block: The code that might throw an exception is enclosed within a try block. Dart tries to execute this code normally.

Catch Block: If an exception is thrown within the try block, Dart looks for a matching catch block.
Catch blocks specify what to do when a specific type of exception occurs.
we can have multiple catch blocks to handle different types of exceptions.

Throw Statement: If we encounter an exceptional situation within your code and want to trigger an exception manually, we can use the throw statement.
This allows you to raise exceptions explicitly.
 */

void main(){
  printer();
}
void printer(){

  try{
    printHeadline();
  }
  // Catch specific exceptions and handle them accordingly.
  on CustomException{
    print('Custom Error');
  }on MachineException {
    print('Machine error');
  }
  catch(e){
    // if(e is CustomException){
    //   print('CustomException " flskhfkds');
    // }
    // else if(e is MachineException){
    //   print('Machine Exception');
    // }
    // else
    print('Something went wrong: ${e.toString()}');
  }
  //FINALLY IS WHERE it dosen't matter if we execute try or catch but final will be executed.
  finally{
    print('Code from finally');
  }

  printContent();
}

// Function to print the headline.
void printHeadline() {
  // Uncomment one of the lines below to see different exceptions being thrown.
  // throw MachineException();
  throw CustomException();
  // throw Exception('not printing');
  // print('Printing Headline');
}

// Function to print the main content.
void printContent() {
  print('Printing main content');
}

// Define a custom exception class for handling custom exceptions.
class CustomException implements Exception{
  @override
  String toString() {
    return 'This is our custom exception class';
  }
}

// Define another custom exception class for handling machine-related exceptions.
class MachineException implements Exception{
  @override
  String toString() {
    return 'This is our printer exception class';
  }
}