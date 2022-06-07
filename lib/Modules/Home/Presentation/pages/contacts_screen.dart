import 'package:agenda_eletronica/Modules/Home/Presentation/widgets/contact_widget.dart';
import 'package:flutter/material.dart';
import '../controller/home_screen_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../widgets/add_contact_local.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<HomeScreenController>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Contacts"),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, i) {
                  return ContactWidget(contact: controller.contacts[i]);
                },
                itemCount: controller.contacts.length,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Modular.to
                    .pushNamed('/addContactManually', arguments: controller);
              },
              icon: const Icon(Icons.add),
              label: const Text('add contact manually'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const AddContactLocalDialog();
                  },
                );
              },
              icon: const Icon(Icons.add),
              label: const Text('add contact from contacts'),
            )
          ],
        ),
      ),
    );
  }
}
