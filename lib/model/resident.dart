import 'package:amparo_app/model/health_insurance.dart';

import 'gender.dart';
import 'marital_status.dart';
import 'race.dart';

class Resident {
  final int id;
  final String name;
  final String? socialName;
  final String? nickname;
  final String cpf;
  final String rg;
  final Race race;
  final Gender gender;
  final MaritalStatus maritalStatus;
  final String birthDate;
  final HealthInsurance healthInsurance;
  final List<Responsible> responsibleList;
  final Treatment? treatment;
  final String createdAt;
  final String updatedAt;

  Resident(
      {required this.id,
      required this.name,
      required this.socialName,
      required this.nickname,
      required this.cpf,
      required this.rg,
      required this.race,
      required this.gender,
      required this.maritalStatus,
      required this.birthDate,
      required this.healthInsurance,
      required this.responsibleList,
      required this.treatment,
      required this.createdAt,
      required this.updatedAt});

  factory Resident.fromJson(Map<String, dynamic> json) {
    return Resident(
      id: json['id'],
      name: json['name'],
      socialName: json['socialName'],
      nickname: json['nickname'],
      cpf: json['cpf'],
      rg: json['rg'],
      race: ResponseRaceMap[json['race']]!,
      gender: ResponseGenderMap[json['gender']]!,
      maritalStatus: ResponseMaritalStatusMap[json['maritalStatus']]!,
      birthDate: json['birthDate'],
      healthInsurance: HealthInsurance.fromJson(json['healthInsurance']),
      responsibleList: json['responsibleList'],
      treatment: json['treatment'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
