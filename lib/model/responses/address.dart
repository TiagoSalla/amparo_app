import '../enums/federative_unit.dart';

class Address {
  final int id;
  final String streetName;
  final String district;
  final int number;
  final String? observation;
  final String zipCode;
  final String cityName;
  final FederativeUnit federativeUnit;
  final String? createdAt;
  final String? updatedAt;

  Address(
      {required this.id,
      required this.streetName,
      required this.district,
      required this.number,
      required this.observation,
      required this.zipCode,
      required this.cityName,
      required this.federativeUnit,
      required this.createdAt,
      required this.updatedAt});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
        id: json['id'],
        streetName: json['streetName'],
        district: json['district'],
        number: json['number'],
        observation: json['observation'],
        zipCode: json['zipCode'],
        cityName: json['cityName'],
        federativeUnit: ResponseFederativeUnitMap[json['federativeUnit']]!,
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt']);
  }
}
