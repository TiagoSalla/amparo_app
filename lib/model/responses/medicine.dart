import 'dosage.dart';

class Medicine {
  final int id;
  final String name;
  final Dosage dosage;
  final String laboratory;
  final String dueDate;
  final bool statusActive;
  final String? createdAt;
  final String? updatedAt;

  Medicine(
      {required this.id,
      required this.name,
      required this.dosage,
      required this.laboratory,
      required this.dueDate,
      required this.statusActive,
      required this.createdAt,
      required this.updatedAt});

  factory Medicine.fromJson(Map<String, dynamic> json) {
    return Medicine(
        id: json['id'],
        name: json['name'],
        dosage: Dosage.fromJson(json['dosage']),
        laboratory: json['laboratory'],
        dueDate: json['dueDate'],
        statusActive: json['statusActive'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt']);
  }
}
