import 'dart:typed_data';
import 'address.dart';

class Contact {
  final String name;
  final List<String> cellPhoneNumber;
  final String email;
  final Uint8List image;
  final Address address;
  final DateTime reminder;
  final String id;

  const Contact({
    required this.name,
    required this.cellPhoneNumber,
    required this.email,
    required this.image,
    required this.address,
    required this.reminder,
    required this.id,
  });
}
