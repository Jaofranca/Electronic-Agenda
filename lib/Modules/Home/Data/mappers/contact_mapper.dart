import 'dart:convert';
import 'dart:typed_data';

import '../../Domain/entities/contact.dart';
import 'address_mapper.dart';

class ContactMapper {
  static Map<String, dynamic> toMap(Contact contact) {
    return <String, dynamic>{
      'name': contact.name,
      'cellPhoneNumber': contact.cellPhoneNumber,
      'email': contact.email,
      'image': contact.image.toList(),
      'address': AddressMapper.toMap(contact.address),
      'reminder': contact.reminder.toIso8601String(),
      'id': contact.id,
    };
  }

  static fromMap(Map<dynamic, dynamic> map) {
    return Contact(
      name: map['name'] as String,
      cellPhoneNumber:
          List<String>.from((map['cellPhoneNumber'] as List<String>)),
      email: map['email'] as String,
      image: Uint8List.fromList(map['image'].cast<int>()),
      address: AddressMapper.fromMap(map['address'] as Map<String, dynamic>),
      reminder: DateTime.parse(map['reminder']),
      id: map['id'] as String,
    );
  }

  static String toJson(Contact contact) => json.encode(toMap(contact));

  static fromJson(String source) =>
      fromMap(json.decode(source) as Map<String, dynamic>);
}
