import 'package:agenda_eletronica/Core/errors/exceptions.dart';
import 'package:agenda_eletronica/Domain/entities/contact.dart';
import 'package:agenda_eletronica/Core/errors/failures.dart';
import 'package:agenda_eletronica/Domain/repositories/contact_repository.dart';
import 'package:dartz/dartz.dart';
import '../datasources/contact_local_datasource.dart';

class ContactRepositoryImplementation implements ContactRepository {
  final ContactLocalDatasource localDatasource;
  ContactRepositoryImplementation({required this.localDatasource});
  @override
  Future<Either<Failure, Contact>> addContact(Contact contact) async {
    try {
      Contact result = await localDatasource.addContact(contact);
      return right(result);
    } on ServerException {
      return left(ServerFailure());
    }
  }
}
