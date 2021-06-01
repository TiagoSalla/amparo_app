enum Gender {
  male,
  female
}

const Map<String, Gender> ResponseGenderMap = {
  'MALE': Gender.male,
  'FEMALE': Gender.female,
};

const Map<Gender, String> RequestGenderMap = {
  Gender.male: 'MALE',
  Gender.female: 'FEMALE',
};