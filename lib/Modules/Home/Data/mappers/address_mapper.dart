import 'dart:convert';

import '../../Domain/entities/address.dart';

class AddressMapper {
  static Map<String, dynamic> toMap(Address address) {
    return <String, dynamic>{
      'zipCode': address.zipCode,
      'city': address.city,
      'state': address.stateCode,
      'logradouro': address.neighborhood,
      'streetNumber': address.streetNumber,
      'complemento': address.complemento,
    };
  }

  static fromMap(Map<String, dynamic> map) {
    return Address(
      zipCode: map['zipCode'] as String,
      city: map['city'] as String,
      stateCode: map['state'] as String,
      neighborhood: map['logradouro'] as String,
      streetNumber: map['streetNumber'] as String,
      complemento: map['complemento'] as String,
    );
  }

  static String toJson(Address address) => json.encode(toMap(address));

  static fromJson(String source) =>
      fromMap(json.decode(source) as Map<String, dynamic>);
}
