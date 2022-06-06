import '../../Core/errors/failures.dart';
import '../entities/contact.dart';
import 'package:dartz/dartz.dart';

abstract class ContactRepository {
  //TODO: get contacts for app initialization
  Future<Either<Failure, List<Contact>>> getContacts();
  Future<Either<Failure, void>> addContact(Contact contact);
  Future<Either<Failure, void>> deleteContact(Contact contact);
  Future<Either<Failure, Contact>> modifyContact(Contact contact);
}
