import '../../Domain/entities/contact.dart';
import 'address_mapper.dart';

class ContactMapper {
  static fromJson(Map<String, dynamic> json) {
    return Contact(
      name: json['name'],
      cellPhoneNumber: json['cellPhoneNumber'],
      email: json['email'],
      image: json['image'],
      address: AddressMapper.fromJson(json['address']),
      reminder: json['reminder'],
    );
  }

  static Map<String, dynamic> toJson(Contact contact) {
    return {
      'name': contact.name,
      'cellPhoneNumber': contact.cellPhoneNumber,
      'email': contact.email,
      'image': contact.image,
      'address': AddressMapper.toJson(contact.address!),
      'reminder': contact.reminder
    };
  }
}
