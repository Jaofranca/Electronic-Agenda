import 'package:dartz/dartz.dart';

import '../../../Core/errors/failures.dart';
import '../../entities/contact.dart';
import '../../repositories/contact_repository.dart';

abstract class DeleteContactUseCase {
  Future<Either<Failure, void>> call(Contact contact);
}

class DeleteContactUseCaseImplementation implements DeleteContactUseCase {
  final ContactRepository contactRepository;
  const DeleteContactUseCaseImplementation({required this.contactRepository});
  @override
  Future<Either<Failure, void>> call(Contact contact) async {
    return await contactRepository.deleteContact(contact);
  }
}
