import '../../Domain/entities/contact.dart';

abstract class ContactLocalDatasource {
  Future<Contact> addContact(Contact contact);
}

class ContactLocalDataSourceImplementation implements ContactLocalDatasource {
  @override
  Future<Contact> addContact(Contact contact) {
    throw UnimplementedError();
  }
}
