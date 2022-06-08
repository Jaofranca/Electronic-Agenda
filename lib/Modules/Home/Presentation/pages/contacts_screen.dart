import 'package:agenda_eletronica/Modules/Home/Presentation/pages/add_contact_screen.dart/add_contact_arguments.dart';
import 'package:agenda_eletronica/Modules/Home/Presentation/widgets/contact_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hive/hive.dart';
import '../../Domain/entities/address.dart';
import '../../Domain/entities/contact.dart';
import '../controller/home_screen_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../widgets/add_contact_local.dart';

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
                      onPressed: () {
                        // Modular.to.pushNamed(
                        //   '/addContactManually',
                        //   arguments: AddContactManuallyArguments(
                        //       controller: controller,
                        //       contact: controller.contacts[i]))
                      },
                    );
                  },
                  itemCount: controller.contacts.length,
                ),
              );
            }),
            ElevatedButton.icon(
              onPressed: () {
                Modular.to.pushNamed('/addContactManually',
                    arguments:
                        AddContactManuallyArguments(controller: controller));
              },
              icon: const Icon(Icons.add),
              label: const Text('add contact manually'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Hive.box('contacts').clear();
                // Modular.to.pushNamed('/addContactManually',
                //     arguments:
                //         AddContactManuallyArguments(controller: controller));
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
