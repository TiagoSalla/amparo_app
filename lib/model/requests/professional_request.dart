import 'package:intl/intl.dart';

import '../enums/gender.dart';
import '../enums/marital_status.dart';
import '../enums/professional_specialty.dart';
import '../enums/race.dart';
import '../requests/address_request.dart';
import 'address_request.dart';

class ProfessionalRequest {
  final String name;
  final String? socialName;
  final String? nickname;
  final String username;
  final String password;
  final ProfessionalSpecialty professionalSpecialty;
  final String register;
  final String cpf;
  final String rg;
  final DateTime birthDate;
  final Race race;
  final Gender gender;
  final MaritalStatus maritalStatus;
  final AddressRequest addressRequest;
  final String email;
  final String mobilePhone;
  final String? residentialPhone;

  ProfessionalRequest({
    required this.name,
    this.socialName,
    this.nickname,
    required this.username,
    required this.password,
    required this.professionalSpecialty,
    required this.register,
    required this.cpf,
    required this.rg,
    required this.birthDate,
    required this.race,
    required this.gender,
    required this.maritalStatus,
    required this.addressRequest,
    required this.email,
    required this.mobilePhone,
    this.residentialPhone,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'socialName': socialName,
      'nickname': nickname,
      'username': username,
      'password': password,
      'professionalSpecialty': RequestProfessionalSpecialtyMap[professionalSpecialty],
      'register': register,
      'cpf': cpf,
      'rg': rg,
      'birthDate': DateFormat('yyyy-MM-dd').format(birthDate),
      'race': RequestRaceMap[race],
      'gender': RequestGenderMap[gender],
      'maritalStatus': RequestMaritalStatusMap[maritalStatus],
      'addressRequest': addressRequest.toJson(),
      'email': email,
      'mobilePhone': mobilePhone,
      'residentialPhone': residentialPhone,
    };
  }
}
