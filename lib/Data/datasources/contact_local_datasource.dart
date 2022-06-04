import '../../Domain/entities/contact.dart';
import '../mappers/contact_mapper.dart';

abstract class ContactLocalDatasource {
  Future<Contact> addContact(Contact contact);
}

class ContactLocalDataSourceImplementation implements ContactLocalDatasource {
  @override
  Future<Contact> addContact(Contact contact) {
    final json = ContactMapper.toJson(contact);
    //TODO: add hive
    throw UnimplementedError();
  }
}
