import '../enums/administration_route.dart';
import '../enums/frequency_type.dart';
import '../enums/quantity_type.dart';

class DosageRequest {
  final int quantity;
  final QuantityType quantityType;
  final int frequency;
  final FrequencyType frequencyType;
  final AdministrationRoute administrationRoute;

  DosageRequest(
      {required this.quantity,
      required this.quantityType,
      required this.frequency,
      required this.frequencyType,
      required this.administrationRoute});

  Map<String, dynamic> toJson() {
    return {
      'quantity': quantity,
      'quantityType': RequestQuantityTypeMap[quantityType],
      'frequency': frequency,
      'frequencyType': RequestFrequencyTypeMap[frequencyType],
      'administrationRoute': RequestAdministrationRouteMap[administrationRoute],
    };
  }
}
