import 'package:agenda_eletronica/Modules/Home/Domain/entities/contact.dart';
import 'package:flutter/material.dart';

class ContactWidget extends StatelessWidget {
  final Contact contact;
  const ContactWidget({required this.contact});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          //TODO: popup do card do usuário
        },
        title: Text(contact.name!),
        subtitle: Text(contact.email! + contact.cellPhoneNumber![0]),
        // trailing: CircleAvatar(
        //   backgroundImage: contact.image,
        // ),
      ),
    );
  }
}
