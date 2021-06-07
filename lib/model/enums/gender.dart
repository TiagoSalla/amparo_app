enum Gender {
  male,
  female
}

extension GenderExtension on Gender {
  String get description {
    switch (this) {
      case Gender.male:
        return 'Masculino';
      case Gender.female:
        return 'Feminino';
    }
  }
}

const Map<String, Gender> ResponseGenderMap = {
  'MALE': Gender.male,
  'FEMALE': Gender.female,
};

const Map<Gender, String> RequestGenderMap = {
  Gender.male: 'MALE',
  Gender.female: 'FEMALE',
};
