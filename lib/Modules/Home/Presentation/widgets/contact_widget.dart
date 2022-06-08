// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:agenda_eletronica/Modules/Home/Domain/entities/contact.dart';

class ContactWidget extends StatelessWidget {
  final Contact contact;
  final Function() modify;
  final Function() delete;
  const ContactWidget(
      {Key? key,
      required this.contact,
      required this.modify,
      required this.delete})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(contact.name),
        subtitle: Text(contact.email + contact.cellPhoneNumber[0]),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.mode),
              onPressed: modify,
            ),
            IconButton(onPressed: delete, icon: const Icon(Icons.delete))
          ],
        ),
        // trailing: CircleAvatar(
        //   backgroundImage: contact.image,
        // ),
      ),
    );
  }
}
