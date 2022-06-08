import 'package:dartz/dartz.dart';
import '../../../Core/errors/failures.dart';
import '../../entities/contact.dart';
import '../../repositories/contact_repository.dart';

class DeleteContactUseCase {
  final ContactRepository contactRepository;
  DeleteContactUseCase({required this.contactRepository});

  Future<Either<Failure, void>> call(Contact contact) async {
    return await contactRepository.deleteContact(contact);
  }
}
