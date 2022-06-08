import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';

import '../controller/home_screen_controller.dart';
import '../widgets/contact_widget.dart';
import 'add_contact_screen/add_contacts_manually_arguments.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<HomeScreenController>();
    controller.getContacts();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Contacts"),
        ),
        body: Column(
          children: [
            Observer(builder: (_) {
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, i) {
                    return ContactWidget(
                        contact: controller.contacts[i],
                        modify: () => Modular.to.pushNamed(
                              '/addContactManually',
                              arguments: AddContactsManuallyArguments(
                                  controller: controller,
                                  contact: controller.contacts[i]),
                            ),
                        delete: () =>
                            controller.deleteContact(controller.contacts[i]));
                  },
                  itemCount: controller.contacts.length,
                ),
              );
            }),
            ElevatedButton.icon(
              onPressed: () {
                Modular.to.pushNamed('/addContactManually',
                    arguments:
                        AddContactsManuallyArguments(controller: controller));
              },
              icon: const Icon(Icons.add),
              label: const Text('add contact manually'),
            ),
          ],
        ),
      ),
    );
  }
}
