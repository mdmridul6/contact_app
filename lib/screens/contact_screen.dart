import 'package:flutter/material.dart';

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({super.key});

  @override
  _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  final List<Map<String, String>> _contacts = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _addContact() {
    if (_formKey.currentState?.validate() ?? false) {
      final String name = _nameController.text;
      final String number = _numberController.text;

      setState(() {
        _contacts.add({'name': name, 'number': number});
      });

      _nameController.clear();
      _numberController.clear();
    }
  }

  String? _validateName(String? name) {
    if (name == null || name.isEmpty) {
      return 'Name cannot be empty';
    }
    return null;
  }

  String? _validateNumber(String? number) {
    if (number == null || number.isEmpty) {
      return 'Number cannot be empty';
    }
    return null;
  }

  void _deleteContact(int index) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Contact'),
        content: const Text('Are you sure you want to delete this contact?'),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
          TextButton(
            child: const Text('Delete'),
            onPressed: () {
              setState(() {
                _contacts.removeAt(index);
              });
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'Name'),
                    validator: _validateName,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _numberController,
                    decoration: const InputDecoration(labelText: 'Phone Number'),
                    keyboardType: TextInputType.phone,
                    validator: _validateNumber,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _addContact,
                    child: const Text('Add'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: _contacts.length,
                itemBuilder: (ctx, index) {
                  return InkWell(
                    onLongPress: () => _deleteContact(index),
                    child: ListTile(
                      leading: const Icon(Icons.account_circle_rounded,size: 48,),
                      tileColor: Colors.grey.shade300,
                      title: Text(_contacts[index]['name']!),
                      subtitle: Text(_contacts[index]['number']!),
                      trailing: const Icon(Icons.phone),
                    ),
                  );
                }, separatorBuilder: (BuildContext context, int index) {
                  return const Divider(color: Colors.black12,);
              },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
