import '../enums/health_insurance_type.dart';

class HealthInsurance {
  final int id;
  final HealthInsuranceType healthInsuranceType;
  final String inscription;
  final String? observation;
  final String? createdAt;
  final String? updatedAt;

  HealthInsurance(
      {required this.id,
      required this.healthInsuranceType,
      required this.inscription,
      required this.observation,
      required this.createdAt,
      required this.updatedAt});

  factory HealthInsurance.fromJson(Map<String, dynamic> json) {
    return HealthInsurance(
        id: json['id'],
        healthInsuranceType: ResponseHealthInsuranceTypeMap[json['healthInsuranceType']]!,
        inscription: json['inscription'],
        observation: json['observation'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt']);
  }
}
