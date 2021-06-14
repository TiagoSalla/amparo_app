import '../enums/health_insurance_type.dart';

class HealthInsuranceRequest {
  final HealthInsuranceType healthInsuranceType;
  final String inscription;
  final String? observation;

  HealthInsuranceRequest({required this.healthInsuranceType, required this.inscription, this.observation});

  Map<String, dynamic> toJson() {
    return {
      'healthInsuranceRawValue': RequestHealthInsuranceTypeMap[healthInsuranceType],
      'inscription': inscription,
      'observation': observation
    };
  }
}
