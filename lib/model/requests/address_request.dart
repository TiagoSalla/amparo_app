import '../enums/federative_unit.dart';

class AddressRequest {
  final String streetName;
  final String district;
  final int number;
  final String? observation;
  final String zipCode;
  final String cityName;
  final FederativeUnit federativeUnit;

  AddressRequest(
      {required this.streetName,
      required this.district,
      required this.number,
      this.observation,
      required this.zipCode,
      required this.cityName,
      required this.federativeUnit});

  Map<String, dynamic> toJson() {
    return {
      'streetName': streetName,
      'district': district,
      'number': number,
      'observation': observation,
      'zipCode': zipCode,
      'cityName': cityName,
      'federativeUnit': RequestFederativeUnitMap[federativeUnit],
    };
  }
}
