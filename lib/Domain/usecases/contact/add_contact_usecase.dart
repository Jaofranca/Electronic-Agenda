import 'package:agenda_eletronica/Domain/repositories/contact_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../Core/errors/failures.dart';
import '../../entities/contact.dart';

class AddContactUseCase {
  final ContactRepository contactRepository;
  AddContactUseCase({required this.contactRepository});

  Future<Either<Failure, Contact>> call(Contact contact) async {
    return await contactRepository.addContact(contact);
  }
}
