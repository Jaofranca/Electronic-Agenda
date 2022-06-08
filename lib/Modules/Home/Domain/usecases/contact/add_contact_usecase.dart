import 'package:dartz/dartz.dart';

import '../../../Core/errors/failures.dart';
import '../../entities/contact.dart';
import '../../repositories/contact_repository.dart';

abstract class AddContactUseCase {
  Future<Either<Failure, void>> call(Contact contact);
}

class AddContactUseCaseImplementation implements AddContactUseCase {
  final ContactRepository contactRepository;
  AddContactUseCaseImplementation({required this.contactRepository});

  @override
  Future<Either<Failure, void>> call(Contact contact) async {
    return await contactRepository.addContact(contact);
  }
}
