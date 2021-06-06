import '../enums/administration_route.dart';
import '../enums/frequency_type.dart';
import '../enums/quantity_type.dart';

class Dosage {
  final int id;
  final int quantity;
  final QuantityType quantityType;
  final int frequency;
  final FrequencyType frequencyType;
  final AdministrationRoute administrationRoute;
  final String? createdAt;
  final String? updatedAt;

  Dosage(
      {required this.id,
      required this.quantity,
      required this.quantityType,
      required this.frequency,
      required this.frequencyType,
      required this.administrationRoute,
      required this.createdAt,
      required this.updatedAt});

  factory Dosage.fromJson(Map<String, dynamic> json) {
    return Dosage(
        id: json['id'],
        quantity: json['quantity'],
        quantityType: ResponseQuantityTypeMap[json['quantityType']]!,
        frequency: json['frequency'],
        frequencyType: ResponseFrequencyTypeMap[json['frequencyType']]!,
        administrationRoute: ResponseAdministrationRouteMap[json['administrationRoute']]!,
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt']);
  }
}
