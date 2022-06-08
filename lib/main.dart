import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_module.dart';
import 'core/hive_initialization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  hiveInitialization(
      onInitialized: () => runApp(
            ModularApp(
              module: AppModule(),
              child: const AppWidget(),
            ),
          ));
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Contact Agenda",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.black, scaffoldBackgroundColor: Colors.black),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
