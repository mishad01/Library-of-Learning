/*3 Types of Button
1. Text Button(Flat Button)
2. Elevated Button(Raised Button)
3. Outlined Button*/
TextButton(
            onPressed: () {
              print("On pressed");
            },
            onLongPress: () {
              print("Long pressed");
            },
            child: Text("Text Button"),
          ),

ElevatedButton(
            onPressed: () {
              print("On pressed");
            },
            onLongPress: () {
              print("Long pressed");
            },
            child: Text("Text Button"),
          ),
OutlinedButton(
            onPressed: () {
              print("On pressed");
            },
            onLongPress: () {
              print("Long pressed");
            },
            child: Text("Text Button"),
          ),