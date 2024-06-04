import 'package:flutter/material.dart';
import 'package:module14_assignment/widgets/add.dart';

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({super.key});

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: const Text(
          'Contact List',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            AddNameNumber(),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: 10,
                primary: false,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                      color: Colors.grey.shade200, child: _ListTile());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile _ListTile() {
    return ListTile(
      title: Text(
        "Name",
        style: TextStyle(color: Colors.red),
      ),
      leading: Icon(Icons.person),
      subtitle: Text("348758394"),
      trailing: Icon(Icons.call),
    );
  }
}
