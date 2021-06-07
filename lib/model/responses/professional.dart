import '../enums/gender.dart';
import '../enums/marital_status.dart';
import '../enums/professional_specialty.dart';
import '../enums/race.dart';
import 'address.dart';

class Professional {
  final int id;
  final String name;
  final String? socialName;
  final String? nickname;
  final ProfessionalSpecialty professionalSpecialty;
  final String register;
  final String cpf;
  final String rg;
  final String birthDate;
  final int age;
  final Race race;
  final Gender gender;
  final MaritalStatus maritalStatus;
  final Address address;
  final String email;
  final String mobilePhone;
  final String? residentialPhone;
  final String? createdAt;
  final String? updatedAt;

  Professional(
      {required this.id,
      required this.name,
      required this.socialName,
      required this.nickname,
      required this.professionalSpecialty,
      required this.register,
      required this.cpf,
      required this.rg,
      required this.birthDate,
      required this.age,
      required this.race,
      required this.gender,
      required this.maritalStatus,
      required this.address,
      required this.email,
      required this.mobilePhone,
      required this.residentialPhone,
      required this.createdAt,
      required this.updatedAt});

  factory Professional.fromJson(Map<String, dynamic> json) {
    return Professional(
        id: json['id'],
        name: json['name'],
        socialName: json['socialName'],
        nickname: json['nickname'],
        professionalSpecialty: ResponseProfessionalSpecialtyMap[json['professionalSpecialty']]!,
        register: json['register'],
        cpf: json['cpf'],
        rg: json['rg'],
        birthDate: json['birthDate'],
        age: json['age'],
        race: ResponseRaceMap[json['race']]!,
        gender: ResponseGenderMap[json['gender']]!,
        maritalStatus: ResponseMaritalStatusMap[json['maritalStatus']]!,
        address: Address.fromJson(json['address']),
        email: json['email'],
        mobilePhone: json['mobilePhone'],
        residentialPhone: json['residentialPhone'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt']);
  }
}
