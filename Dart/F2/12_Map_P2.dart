class _appp extends State<appp> {
  @override
  Widget build(BuildContext context) {
    var arrnames = ["Mishad", "Saif", "Ananya", "Oney", "Prachi"];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          //If our design is same but if we want different value then we will use this this map list view
          appBar: AppBar(
            title: Text("Flutter App"),
          ),
          body: Container(
            child: ListView(
                children: arrnames.map((value) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(21),
                    color: const Color.fromARGB(255, 112, 152, 221),
                  ),
                  child: Center(child: Text(value)),
                ),
              );
            }).toList()),
          )),
    );
  }
}
