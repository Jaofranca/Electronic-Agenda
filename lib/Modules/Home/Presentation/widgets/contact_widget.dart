// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:agenda_eletronica/Modules/Home/Domain/entities/contact.dart';

class ContactWidget extends StatelessWidget {
  final Contact contact;
  final Function onPressed;
  const ContactWidget({
    Key? key,
    required this.contact,
    required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          //TODO: popup do card do usuário
        },
        title: Text(contact.name),
        subtitle: Text(contact.email + contact.cellPhoneNumber[0]),
        trailing: IconButton(
          icon: const Icon(Icons.add),
          onPressed: onPressed(),
        ),
        // trailing: CircleAvatar(
        //   backgroundImage: contact.image,
        // ),
      ),
    );
  }
}
