import '../../Domain/entities/address.dart';

class AddressMapper {
  static fromJson(Map<String, dynamic> json) {
    return Address(
      zipCode: json['zipCode'],
      city: json['city'],
      state: json['state'],
      logradouro: json['logradouro'],
      number: json['number'],
      complemento: json['complemento'],
    );
  }

  static Map<String, dynamic> toJson(Address address) {
    return {
      'zipCode': address.zipCode,
      'city': address.city,
      'state': address.state,
      'logradouro': address.logradouro,
      'number': address.number,
      'complemento': address.complemento
    };
  }
}
