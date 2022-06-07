import 'address.dart';

class Contact {
  final String? name;
  final List<String>? cellPhoneNumber;
  final String? email;
  final String? image;
  final Address? address;
  final DateTime? reminder;

  Contact({
    this.name,
    this.cellPhoneNumber,
    this.email,
    this.image,
    this.address,
    this.reminder,
  });
}
