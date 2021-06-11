import '../enums/gender.dart';
import '../enums/marital_status.dart';
import '../enums/race.dart';
import 'package:intl/intl.dart';

import 'health_insurance_request.dart';

class ResidentRequest {
  final String name;
  final String? socialName;
  final String? nickname;
  final String cpf;
  final String rg;
  final Race race;
  final Gender gender;
  final MaritalStatus maritalStatus;
  final DateTime birthDate;
  final HealthInsuranceRequest healthInsurance;

  ResidentRequest(
      {required this.name,
      this.socialName,
      this.nickname,
      required this.cpf,
      required this.rg,
      required this.race,
      required this.gender,
      required this.maritalStatus,
      required this.birthDate,
      required this.healthInsurance});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'socialName': socialName,
      'nickname': nickname,
      'cpf': cpf,
      'rg': rg,
      'race': RequestRaceMap[race],
      'gender': RequestGenderMap[gender],
      'maritalStatus': RequestMaritalStatusMap[maritalStatus],
      'birthDate': DateFormat('yyyy-MM-dd').format(birthDate),
      'healthInsurance': healthInsurance.toJson(),
    };
  }
}
