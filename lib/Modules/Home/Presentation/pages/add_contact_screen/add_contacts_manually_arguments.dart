import '../../../Domain/entities/contact.dart';
import '../../controller/home_screen_controller.dart';

class AddContactsManuallyArguments {
  final HomeScreenController controller;
  final Contact? contact;
  const AddContactsManuallyArguments({required this.controller, this.contact});
}
