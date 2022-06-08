// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import 'package:agenda_eletronica/Modules/Home/Domain/entities/address.dart';
import 'package:agenda_eletronica/Modules/Home/Domain/entities/contact.dart';
import 'package:agenda_eletronica/Modules/Home/Presentation/pages/add_contact_screen.dart/add_contact_arguments.dart';
import 'package:agenda_eletronica/Modules/Home/Presentation/widgets/add_contact_text_field.dart';

class AddContactManuallyScreen extends StatefulWidget {
  final AddContactManuallyArguments args;
  const AddContactManuallyScreen({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  State<AddContactManuallyScreen> createState() =>
      _AddContactManuallyScreenState();
}

class _AddContactManuallyScreenState extends State<AddContactManuallyScreen> {
  var uuid = const Uuid();
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController zipCodeController;
  late final TextEditingController cityController;
  late final TextEditingController stateController;
  late final TextEditingController logradouroController;
  late final TextEditingController streetNumberController;
  late final TextEditingController complementoController;

  @override
  void initState() {
    super.initState();
    _initializeForm();
  }

  @override
  void dispose() {
    _closeForm();
    super.dispose();
  }

  void _closeForm() {
    nameController.dispose();
    emailController.dispose();
    //PhoneController
    zipCodeController.dispose();
    cityController.dispose();
    stateController.dispose();
    logradouroController.dispose();
    streetNumberController.dispose();
  }

  void _initializeForm() {
    nameController = TextEditingController(text: widget.args.contact?.name);
    emailController = TextEditingController(text: widget.args.contact?.email);
    zipCodeController =
        TextEditingController(text: widget.args.contact?.address.zipCode);
    cityController =
        TextEditingController(text: widget.args.contact?.address.city);
    stateController =
        TextEditingController(text: widget.args.contact?.address.stateCode);
    logradouroController =
        TextEditingController(text: widget.args.contact?.address.neighborhood);
    streetNumberController =
        TextEditingController(text: widget.args.contact?.address.streetNumber);
    complementoController =
        TextEditingController(text: widget.args.contact?.address.complemento);
  }

  @override
  Widget build(BuildContext context) {
    // List stuff = image.toByteData().buffer.asUInt8List()
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
              Material(
                child: InkWell(
                  onTap: () async {
                    final ImagePicker picker = ImagePicker();
                    final XFile? photo =
                        await picker.pickImage(source: ImageSource.camera);
                  },
                  child: const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.red,
                  ),
                ),
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
                  textController: streetNumberController, hintText: 'Number'),
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
                onPressed: () async {
                  final pageContact = Contact(
                      name: nameController.text,
                      cellPhoneNumber: ['123456789'],
                      email: emailController.text,
                      image: Uint8List.fromList([0]),
                      address: Address(
                        zipCode: zipCodeController.text,
                        city: cityController.text,
                        stateCode: stateController.text,
                        neighborhood: logradouroController.text,
                        streetNumber: streetNumberController.text,
                        complemento: complementoController.text,
                      ),
                      reminder: DateTime.now(),
                      id: widget.args.contact == null
                          ? uuid.v1()
                          : widget.args.contact!.id);

                  await widget.args.controller.addContact(pageContact);
                  Modular.to.pop();
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
