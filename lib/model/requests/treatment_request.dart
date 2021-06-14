class TreatmentRequest {
  final int residentId;
  final int responsibleProfessionalId;
  final List<int> medicineIdList;

  TreatmentRequest({
    required this.residentId,
    required this.responsibleProfessionalId,
    required this.medicineIdList,
  });

  Map<String, dynamic> toJson() {
    return {
      'residentId': residentId,
      'responsibleProfessionalId': responsibleProfessionalId,
      'medicineIdList': medicineIdList,
    };
  }
}
