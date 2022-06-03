import 'package:agenda_eletronica/Core/errors/failures.dart';
import '../entities/contact.dart';
import 'package:dartz/dartz.dart';

abstract class ContactRepository {
  //TODO: get contacts for app initialization
  Future<Either<Failure, Contact>> addContact(Contact contact);
}
