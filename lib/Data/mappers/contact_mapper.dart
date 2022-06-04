import '../../Domain/entities/contact.dart';

class ContactMapper {
  static fromJson(Map<String, dynamic> json) {
    return Contact(
      name: json['name'],
      cellPhoneNumber: json['cellPhoneNumeber'],
      email: json['email'],
      image: json['image'],
      address: json['address'],
      reminder: json['remionder'],
    );
  }

  static Map<String, dynamic> toJson(Contact contact) {
    return {
      'name': contact.name,
      'cellPhoneNumber': contact.cellPhoneNumber,
      'email': contact.email,
      'image': contact.image,
      'address': contact.address,
      'reminder': contact.reminder
    };
  }
}
