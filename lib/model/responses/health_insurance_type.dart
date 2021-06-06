class HealthInsuranceType {
  final String rawValue;
  final String description;

  HealthInsuranceType({required this.rawValue, required this.description});

  factory HealthInsuranceType.fromJson(Map<String, dynamic> json) {
    return HealthInsuranceType(rawValue: json['rawValue'], description: json['description']);
  }
}
