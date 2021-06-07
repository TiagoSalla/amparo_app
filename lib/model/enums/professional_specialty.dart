enum ProfessionalSpecialty {
  doctor,
  nurse,
  caregiver,
  attendant
}

extension ProfessionalSpecialtyExtension on ProfessionalSpecialty {
  String get description {
    switch (this) {
      case ProfessionalSpecialty.doctor:
        return 'Médico(a)';
      case ProfessionalSpecialty.nurse:
        return 'Enfermeiro(a)';
      case ProfessionalSpecialty.caregiver:
        return 'Cuidador(a)';
      case ProfessionalSpecialty.attendant:
        return 'Atendente(a)';
    }
  }
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
