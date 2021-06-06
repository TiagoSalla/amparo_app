enum ProfessionalSpecialty {
  doctor,
  nurse,
  caregiver,
  attendant
}

const Map<String, ProfessionalSpecialty> ResponseProfessionalSpecialtyMap = {
  'DOCTOR': ProfessionalSpecialty.doctor,
  'NURSE': ProfessionalSpecialty.nurse,
  'CAREGIVER': ProfessionalSpecialty.caregiver,
  'ATTENDANT': ProfessionalSpecialty.attendant
};

const Map<ProfessionalSpecialty, String> RequestProfessionalSpecialtyMap = {
  ProfessionalSpecialty.doctor: 'DOCTOR',
  ProfessionalSpecialty.nurse: 'NURSE',
  ProfessionalSpecialty.caregiver: 'CAREGIVER',
  ProfessionalSpecialty.attendant: 'ATTENDANT'
};
