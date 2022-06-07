import 'package:agenda_eletronica/Modules/Home/Domain/entities/address.dart';
import 'package:agenda_eletronica/Modules/Home/Domain/entities/contact.dart';
import 'package:agenda_eletronica/Modules/Home/Presentation/controller/home_screen_controller.dart';
import 'package:agenda_eletronica/Modules/Home/Presentation/widgets/add_contact_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddContactManuallyScreen extends StatelessWidget {
  final HomeScreenController controller;

  const AddContactManuallyScreen({required this.controller});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController zipCodeController = TextEditingController();
    TextEditingController cityController = TextEditingController();
    TextEditingController stateController = TextEditingController();
    TextEditingController logradouroController = TextEditingController();
    TextEditingController numberController = TextEditingController();
    TextEditingController complementoController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text("Add a Contact"),
          leading: IconButton(
            onPressed: () => Modular.to.pop(),
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //TODO: image
              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.red,
              ),

              AddContactTextField(
                  textController: nameController, hintText: 'name'),
              AddContactTextField(
                  textController: emailController, hintText: 'email'),

              AddContactTextField(
                  textController: zipCodeController, hintText: 'Zip Code'),
              AddContactTextField(
                  textController: cityController, hintText: 'City'),
              AddContactTextField(
                  textController: stateController, hintText: 'State'),
              AddContactTextField(
                  textController: logradouroController, hintText: 'Logradouro'),
              AddContactTextField(
                  textController: numberController, hintText: 'Number'),
              AddContactTextField(
                  textController: complementoController,
                  hintText: 'Complemento'),
              //TODO: Reminder
              // ElevatedButton(
              //     child: Text('Pick a date'),
              //     onPressed: () {
              //       showDatePicker(
              //           context: context,
              //           initialDate: DateTime.now(),
              //           firstDate: DateTime(2001),
              //           lastDate: DateTime(2021));
              //     }),
              ElevatedButton.icon(
                onPressed: () {
                  controller.addContact(
                    Contact(
                      name: nameController.text,
                      cellPhoneNumber: ['123456789'],
                      email: emailController.text,
                      image: '...aa',
                      address: Address(
                        zipCode: zipCodeController.text,
                        city: cityController.text,
                        state: stateController.text,
                        logradouro: logradouroController.text,
                        number: numberController.text,
                        complemento: complementoController.text,
                      ),
                      reminder: DateTime.now(),
                    ),
                  );
                },
                icon: const Icon(Icons.add),
                label: const Text("Confirm"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
