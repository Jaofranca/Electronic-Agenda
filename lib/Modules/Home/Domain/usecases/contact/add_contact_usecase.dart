import 'package:dartz/dartz.dart';
import '../../../Core/errors/failures.dart';
import '../../entities/contact.dart';
import '../../repositories/contact_repository.dart';

class AddContactUseCase {
  final ContactRepository contactRepository;
  AddContactUseCase({required this.contactRepository});

  Future<Either<Failure, void>> call(Contact contact) async {
    return await contactRepository.addContact(contact);
  }
}
