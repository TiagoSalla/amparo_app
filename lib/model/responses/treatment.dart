import 'medicine.dart';
import 'professional.dart';

class Treatment {
  final int id;
  final int residentId;
  final String residentName;
  final Professional responsibleProfessional;
  final List<Medicine> medicineList;
  final String? createdAt;
  final String? updatedAt;

  Treatment(
      {required this.id,
        required this.residentId,
        required this.residentName,
        required this.responsibleProfessional,
        required this.medicineList,
        required this.createdAt,
        required this.updatedAt});

  factory Treatment.fromJson(Map<String, dynamic> json) {
    return Treatment(
        id: json['id'],
        residentId: json['residentId'],
        residentName: json['residentName'],
        responsibleProfessional: Professional.fromJson(json['responsibleProfessional']),
        medicineList: (json['medicineList'] as List).map((i) => Medicine.fromJson(i)).toList(),
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt']);
  }
}
