import 'package:flutter_modular/flutter_modular.dart';

import 'Data/datasources/contact_local_datasource.dart';
import 'Data/repositoriesImpl/contact_repository_impl.dart';
import 'Domain/usecases/contact/add_contact_usecase.dart';
import 'Domain/usecases/contact/delete_contact_usecase.dart';
import 'Domain/usecases/contact/get_contact_usecase.dart';
import 'Presentation/Pages/home_screen.dart';
import 'Presentation/controller/home_screen_controller.dart';
import 'Presentation/pages/add_contact_screen/add_contact_manually_screen.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => ContactLocalDataSourceImplementation()),
        Bind((i) => ContactRepositoryImplementation(localDatasource: i())),
        Bind((i) => AddContactUseCaseImplementation(contactRepository: i())),
        Bind((i) => GetContactsUseCaseImplementation(contactRepository: i())),
        Bind((i) => DeleteContactUseCaseImplementation(contactRepository: i())),
        Bind((i) => HomeScreenController(i(), i(), i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const HomeScreen()),
        ChildRoute(
          '/addContactManually',
          child: (_, args) => AddContactManuallyScreen(
            args: args.data,
          ),
        ),
      ];
}
