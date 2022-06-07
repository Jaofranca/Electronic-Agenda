import 'package:agenda_eletronica/Modules/Home/Domain/entities/contact.dart';
import 'package:agenda_eletronica/Modules/Home/Domain/usecases/contact/add_contact_usecase.dart';
import 'package:agenda_eletronica/Modules/Home/Domain/usecases/contact/get_contact_usecase.dart';
import 'package:mobx/mobx.dart';

part 'home_screen_controller.g.dart';

class HomeScreenController = _HomeScreenControllerBase
    with _$HomeScreenController;

abstract class _HomeScreenControllerBase with Store {
  final AddContactUseCase _addContactUseCase;
  final GetContactsUseCase _getContactsUseCase;
  _HomeScreenControllerBase(this._addContactUseCase, this._getContactsUseCase);

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
    return usecase.fold((failure) => throw failure, (result) {});
  }
}
