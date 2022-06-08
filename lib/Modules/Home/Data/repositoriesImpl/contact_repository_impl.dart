import 'package:dartz/dartz.dart';
import '../../Core/errors/exceptions.dart';
import '../../Core/errors/failures.dart';
import '../../Domain/entities/contact.dart';
import '../../Domain/repositories/contact_repository.dart';
import '../datasources/contact_local_datasource.dart';

class ContactRepositoryImplementation implements ContactRepository {
  final ContactLocalDatasource localDatasource;
  ContactRepositoryImplementation({required this.localDatasource});
  @override
  Future<Either<Failure, void>> addContact(Contact contact) async {
    try {
      final result = await localDatasource.addContact(contact);
      return right(result);
    } on CacheException {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteContact(Contact contact) async {
    try {
      final result = await localDatasource.deleteContact(contact);
      return right(result);
    } on CacheException {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Contact>>> getContacts() async {
    try {
      final result = await localDatasource.getContacts();
      return right(result);
    } on CacheException catch (e) {
      return left(ServerFailure());
    }
  }
}
