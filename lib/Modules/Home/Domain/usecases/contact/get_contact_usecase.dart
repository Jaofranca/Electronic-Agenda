import 'package:dartz/dartz.dart';
import '../../../Core/errors/failures.dart';
import '../../entities/contact.dart';
import '../../repositories/contact_repository.dart';

class GetContactsUseCase {
  final ContactRepository contactRepository;
  GetContactsUseCase({required this.contactRepository});

  Future<Either<Failure, List<Contact>>> call() async {
    return await contactRepository.getContacts();
  }
}
