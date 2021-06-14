import 'medicine.dart';
import 'resident.dart';
import 'professional.dart';

class TreatmentOptions {
  final List<Resident> residentList;
  final List<Professional> professionalList;
  final List<Medicine> medicineList;

  TreatmentOptions({required this.residentList, required this.professionalList, required this.medicineList});

  factory TreatmentOptions.fromJson(Map<String, dynamic> json) {
    return TreatmentOptions(
        residentList: (json['residentList'] as List).map((i) => Resident.fromJson(i)).toList(),
        professionalList: (json['professionalList'] as List).map((i) => Professional.fromJson(i)).toList(),
        medicineList: (json['medicineList'] as List).map((i) => Medicine.fromJson(i)).toList());
  }
}
