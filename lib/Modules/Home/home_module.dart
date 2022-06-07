import 'package:agenda_eletronica/Modules/Home/Data/datasources/contact_local_datasource.dart';
import 'package:agenda_eletronica/Modules/Home/Data/repositoriesImpl/contact_repository_impl.dart';
import 'package:agenda_eletronica/Modules/Home/Domain/usecases/contact/add_contact_usecase.dart';
import 'package:agenda_eletronica/Modules/Home/Presentation/pages/add_contact_manually_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'Domain/usecases/contact/get_contact_usecase.dart';
import 'Presentation/Pages/home_screen.dart';
import 'Presentation/controller/home_screen_controller.dart';

class HomeModule extends Module {
  // Provide a list of dependencies to inject into your project
  @override
  List<Bind> get binds => [
        Bind((i) => ContactLocalDataSourceImplementation()),
        Bind((i) => ContactRepositoryImplementation(localDatasource: i())),
        Bind(
          (i) => AddContactUseCase(contactRepository: i()),
        ),
        Bind(
          (i) => GetContactsUseCase(contactRepository: i()),
        ),
        Bind((i) => HomeScreenController(i(), i())),
      ];

  // Provide all the routes for your module
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const HomeScreen()),
        ChildRoute('/addContactManually',
            child: (_, args) => AddContactManuallyScreen(
                  controller: args.data,
                ))
        // ChildRoute('/cardDetailPage',
        //     child: (_, args) => CardDetail(model: args.data)),
      ];
}
