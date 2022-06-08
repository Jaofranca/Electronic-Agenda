import 'package:mobx/mobx.dart';

import '../../Domain/entities/contact.dart';
import '../../Domain/usecases/contact/add_contact_usecase.dart';
import '../../Domain/usecases/contact/delete_contact_usecase.dart';
import '../../Domain/usecases/contact/get_contact_usecase.dart';

part 'home_screen_controller.g.dart';

class HomeScreenController = _HomeScreenControllerBase
    with _$HomeScreenController;

abstract class _HomeScreenControllerBase with Store {
  final AddContactUseCase _addContactUseCase;
  final GetContactsUseCase _getContactsUseCase;
  final DeleteContactUseCase _deleteContactUseCase;

  _HomeScreenControllerBase(this._addContactUseCase, this._getContactsUseCase,
      this._deleteContactUseCase);

  @observable
  List<Contact> contacts = [];

  @action
  void _setContacts(List<Contact> value) {
    contacts = value;
  }

  @action
  Future<void> getContacts() async {
    final usecase = await _getContactsUseCase.call();
    return usecase.fold((failure) => throw failure, (result) {
      _setContacts(result);
    });
  }

  @action
  Future<void> addContact(Contact contact) async {
    final usecase = await _addContactUseCase.call(contact);
    return usecase.fold((failure) => throw failure, (result) {
      getContacts();
    });
  }

  @action
  Future<void> deleteContact(Contact contact) async {
    final usecase = await _deleteContactUseCase.call(contact);
    return usecase.fold((failure) => throw failure, (result) {
      getContacts();
    });
  }
}
