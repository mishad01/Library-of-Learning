import 'package:flutter/material.dart';
import 'package:module14_assignment/contact_list_module.dart';
import 'package:module14_assignment/widgets/add.dart';

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({super.key});

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  List<Contact> contactList = [];

  void _addContact(String name, String number) {
    contactList.add(Contact(name: name, number: number));
    setState(() {});
  }

  void _deleteContact(Contact contact) {
    contactList.remove(contact);
    setState(() {});
  }

  void _showDeleteConfirmationDialog(Contact contact) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Contact'),
          content: Text('Are you sure you want to delete this contact?'),
          actions: [
            TextButton(
              child: Icon(Icons.undo),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Icon(Icons.delete),
              onPressed: () {
                _deleteContact(contact);
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

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
            AddNameNumber(
              onAdd: _addContact,
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: contactList.length,
                primary: false,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPress: () {
                      _showDeleteConfirmationDialog(contactList[index]);
                    },
                    child: Container(
                        color: Colors.grey.shade200,
                        child: _ListTile(contactList[index])),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile _ListTile(Contact contact) {
    return ListTile(
      title: Text(
        contact.name,
        style: TextStyle(color: Colors.red),
      ),
      leading: Icon(Icons.person),
      subtitle: Text(contact.number),
      trailing: Icon(Icons.call),
    );
  }
}
