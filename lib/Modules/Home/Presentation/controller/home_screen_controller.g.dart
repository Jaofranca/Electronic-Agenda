// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeScreenController on _HomeScreenControllerBase, Store {
  late final _$contactsAtom =
      Atom(name: '_HomeScreenControllerBase.contacts', context: context);

  @override
  List<Contact> get contacts {
    _$contactsAtom.reportRead();
    return super.contacts;
  }

  @override
  set contacts(List<Contact> value) {
    _$contactsAtom.reportWrite(value, super.contacts, () {
      super.contacts = value;
    });
  }

  late final _$getContactsAsyncAction =
      AsyncAction('_HomeScreenControllerBase.getContacts', context: context);

  @override
  Future<void> getContacts() {
    return _$getContactsAsyncAction.run(() => super.getContacts());
  }

  late final _$_HomeScreenControllerBaseActionController =
      ActionController(name: '_HomeScreenControllerBase', context: context);

  @override
  void _setContacts(List<Contact> value) {
    final _$actionInfo = _$_HomeScreenControllerBaseActionController
        .startAction(name: '_HomeScreenControllerBase._setContacts');
    try {
      return super._setContacts(value);
    } finally {
      _$_HomeScreenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
contacts: ${contacts}
    ''';
  }
}
