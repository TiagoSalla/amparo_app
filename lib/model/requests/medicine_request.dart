import 'package:intl/intl.dart';

import '../requests/dosage_request.dart';

class MedicineRequest {
  final String name;
  final DosageRequest dosage;
  final String laboratory;
  final DateTime dueDate;
  final bool statusActive;

  MedicineRequest({
    required this.name,
    required this.dosage,
    required this.laboratory,
    required this.dueDate,
    required this.statusActive,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'dosage': dosage.toJson(),
      'laboratory': laboratory,
      'dueDate': DateFormat('yyyy-MM-dd').format(dueDate),
      'statusActive': statusActive,
    };
  }
}
