import 'package:hive/hive.dart';

import '../../Core/errors/exceptions.dart';
import '../../Domain/entities/contact.dart';
import '../mappers/contact_mapper.dart';

abstract class ContactLocalDatasource {
  Future<List<Contact>> getContacts();
  Future<void> addContact(Contact contact);
  Future<void> deleteContact(Contact contact);
  Future<Contact> modifyContact(Contact contact);
}

class ContactLocalDataSourceImplementation implements ContactLocalDatasource {
  @override
  Future<void> addContact(Contact contact) async {
    await Hive.box('contacts').put(contact.id, ContactMapper.toMap(contact));
  }

  @override
  Future<void> deleteContact(Contact contact) async {
    // Hive.box('contacts').delete();
    throw UnimplementedError();
  }

  @override
  Future<List<Contact>> getContacts() async {
    var contacts = Hive.box('contacts').values;
    if (contacts.isNotEmpty) {
      return List.from(
        contacts.map(
          (contact) {
            return ContactMapper.fromMap(contact);
          },
        ),
      );
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Contact> modifyContact(Contact contact) {
    throw UnimplementedError();
  }
}
