import 'package:dartz/dartz.dart';

import '../../../Core/errors/failures.dart';
import '../../entities/contact.dart';
import '../../repositories/contact_repository.dart';

abstract class GetContactsUseCase {
  Future<Either<Failure, List<Contact>>> call();
}

class GetContactsUseCaseImplementation implements GetContactsUseCase {
  final ContactRepository contactRepository;
  GetContactsUseCaseImplementation({required this.contactRepository});
  @override
  Future<Either<Failure, List<Contact>>> call() async {
    return await contactRepository.getContacts();
  }
}
