import '../../../Domain/entities/contact.dart';
import '../../controller/home_screen_controller.dart';

class AddContactManuallyArguments {
  final HomeScreenController controller;
  final Contact? contact;
  AddContactManuallyArguments({required this.controller, this.contact});
}
