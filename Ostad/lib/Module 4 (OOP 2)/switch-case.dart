/* Why in dart switch case works without the break statement?
=>In Dart, each case statement without a break is considered a "fall-through" case. However, Dart has a feature called "fall-through suppression".
 When the case body is empty, Dart automatically suppresses the fall-through behavior, meaning it won't fall through to the next case even if there is no break.
 */
void main(){
  int day= 4;

  switch(day){
    case 1: print('Saturday');
   // break;
    case 2:print('Sunday');
    //break;
    case 3:print('Monday');
    //break;
    case 4:print('Tuesday');
    //break;
    case 5:print('Wednesday');
   // break;
    case 6:print('Thursday');
    break;
    case 7:print('Friday');
    //break;
    default:
      print('Invalid Input');

  }
}