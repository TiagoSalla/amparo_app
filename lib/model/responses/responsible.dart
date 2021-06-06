import 'address.dart';

class Responsible {
  final int id;
  final String name;
  final String? socialName;
  final String cpf;
  final String rg;
  final Address address;
  final String email;
  final String mobilePhone;
  final String? residentialPhone;
  final int residentId;
  final String residentName;
  final String? createdAt;
  final String? updatedAt;

  Responsible(
      {required this.id,
      required this.name,
      required this.socialName,
      required this.cpf,
      required this.rg,
      required this.address,
      required this.email,
      required this.mobilePhone,
      required this.residentialPhone,
      required this.residentId,
      required this.residentName,
      required this.createdAt,
      required this.updatedAt});

  factory Responsible.fromJson(Map<String, dynamic> json) {
    return Responsible(
        id: json['id'],
        name: json['name'],
        socialName: json['socialName'],
        cpf: json['cpf'],
        rg: json['rg'],
        address: Address.fromJson(json['address']),
        email: json['email'],
        mobilePhone: json['mobilePhone'],
        residentialPhone: json['residentialPhone'],
        residentId: json['residentId'],
        residentName: json['residentName'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt']);
  }
}
