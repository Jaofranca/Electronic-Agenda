import 'dart:typed_data';

import 'package:agenda_eletronica/Modules/Home/Presentation/Pages/add_contact_screen/add_contacts_manually_arguments.dart';
import 'package:agenda_eletronica/Modules/Home/Presentation/widgets/add_contact_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:uuid/uuid.dart';

import '../../../Domain/entities/address.dart';
import '../../../Domain/entities/contact.dart';
import '../../widgets/image_source_chooser.dart';

class AddContactManuallyScreen extends StatefulWidget {
  final AddContactsManuallyArguments args;
  const AddContactManuallyScreen({
    required this.args,
    Key? key,
  }) : super(key: key);

  @override
  State<AddContactManuallyScreen> createState() =>
      _AddContactManuallyScreenState();
}

class _AddContactManuallyScreenState extends State<AddContactManuallyScreen> {
  var uuid = const Uuid();
  Uint8List? picture;
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;
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
    phoneController.dispose();
    zipCodeController.dispose();
    cityController.dispose();
    stateController.dispose();
    logradouroController.dispose();
    streetNumberController.dispose();
  }

  void _initializeForm() {
    nameController = TextEditingController(text: widget.args.contact?.name);
    emailController = TextEditingController(text: widget.args.contact?.email);
    phoneController =
        TextEditingController(text: widget.args.contact?.cellPhoneNumber[0]);
    zipCodeController =
        TextEditingController(text: widget.args.contact?.address?.zipCode);
    cityController =
        TextEditingController(text: widget.args.contact?.address?.city);
    stateController =
        TextEditingController(text: widget.args.contact?.address?.stateCode);
    logradouroController =
        TextEditingController(text: widget.args.contact?.address?.neighborhood);
    streetNumberController =
        TextEditingController(text: widget.args.contact?.address?.streetNumber);
    complementoController =
        TextEditingController(text: widget.args.contact?.address?.complemento);

    if (widget.args.contact?.image != null) {
      setState(() {
        picture = widget.args.contact!.image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const ImageSourceChooser();
                      }).then((value) {
                    setState(() {
                      picture = value;
                    });
                  });
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.red,
                      backgroundImage:
                          picture == null ? null : MemoryImage(picture!),
                    ),
                    const Icon(Icons.add),
                  ],
                ),
              ),
              AddContactTextField(
                  textController: nameController, hintText: 'name'),
              AddContactTextField(
                  textController: emailController, hintText: 'email'),
              AddContactTextField(formatter: [
                MaskTextInputFormatter(
                  mask: '(##) # ####-####',
                  filter: {'#': RegExp(r'[0-9]')},
                )
              ], textController: phoneController, hintText: 'cellPhone Number'),
              AddContactTextField(formatter: [
                MaskTextInputFormatter(
                  mask: '##.###-###',
                  filter: {'#': RegExp(r'[0-9]')},
                )
              ], textController: zipCodeController, hintText: 'Zip Code'),
              AddContactTextField(
                  textController: cityController, hintText: 'City'),
              AddContactTextField(
                  textController: stateController, hintText: 'State'),
              AddContactTextField(
                  textController: logradouroController, hintText: 'Logradouro'),
              AddContactTextField(
                textController: streetNumberController,
                hintText: 'Number',
                formatter: [
                  MaskTextInputFormatter(
                    mask: '####',
                    filter: {'#': RegExp(r'[0-9]')},
                  )
                ],
              ),
              AddContactTextField(
                  textController: complementoController,
                  hintText: 'Complemento'),
              ElevatedButton.icon(
                onPressed: () async {
                  final pageContact = Contact(
                      name: nameController.text,
                      cellPhoneNumber: [phoneController.text],
                      email: emailController.text,
                      image: picture,
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
