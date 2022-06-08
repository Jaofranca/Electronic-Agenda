import 'package:dartz/dartz.dart';

import '../../Core/errors/failures.dart';
import '../entities/contact.dart';

abstract class ContactRepository {
  Future<Either<Failure, List<Contact>>> getContacts();
  Future<Either<Failure, void>> addContact(Contact contact);
  Future<Either<Failure, void>> deleteContact(Contact contact);
}
