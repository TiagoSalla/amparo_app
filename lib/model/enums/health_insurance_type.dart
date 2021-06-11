enum HealthInsuranceType {
  ALLIANZ,
  AMEPLAN,
  AMIL_SAUDE,
  BIOSAUDE,
  BIOVIDA_SAUDE,
  BLUE_MED_SAUDE,
  BRADESCO_SAUDE,
  CLASSES_LABORIOSAS,
  CRUZ_AZUL_SAUDE,
  GS_SAUDE,
  GOLDEN_CROSS,
  HAPVIDA,
  HEALTH_SANITARIS,
  INTERCLINICAS_SAUDE,
  MEDICAL_HEALTH,
  MED_TOUR_SAUDE,
  NOTRE_DAME_INTERMEDICA,
  PLANSAUDE,
  PLENA_SAUDE,
  PORTO_SEGURO_SAUDE,
  PREVENT_SENIOR,
  QSAUDE,
  SANTA_HELENA_SAUDE,
  SAO_CRISTOVAO_SAUDE,
  SAO_MIGUEL_SAUDE,
  SEGUROS_UNIMED,
  SOMPO_SAUDE,
  SUL_AMERICA_SAUDE,
  TOTAL_MEDCARE_SAUDE,
  TRASMONTANO_SAUDE,
  UNIHOSP_SAUDE,
  UNIMED,
  SUS
}

extension HealthInsuranceTypeExtension on HealthInsuranceType {
  String get description {
    switch (this) {
      case HealthInsuranceType.ALLIANZ:
        return 'Allianz Saúde';
      case HealthInsuranceType.AMEPLAN:
        return 'Ameplan Saúde';
      case HealthInsuranceType.AMIL_SAUDE:
        return 'Amil Saúde';
      case HealthInsuranceType.BIOSAUDE:
        return 'BioSaúde';
      case HealthInsuranceType.BIOVIDA_SAUDE:
        return 'BioVida Saúde';
      case HealthInsuranceType.BLUE_MED_SAUDE:
        return 'Blue Med Saúde';
      case HealthInsuranceType.BRADESCO_SAUDE:
        return 'Bradesco Saúde';
      case HealthInsuranceType.CLASSES_LABORIOSAS:
        return 'Classes Laboriosas';
      case HealthInsuranceType.CRUZ_AZUL_SAUDE:
        return 'Cruz Azul';
      case HealthInsuranceType.GS_SAUDE:
        return 'GS Saúde';
      case HealthInsuranceType.GOLDEN_CROSS:
        return 'Golden Cross';
      case HealthInsuranceType.HAPVIDA:
        return 'HapVida';
      case HealthInsuranceType.HEALTH_SANITARIS:
        return 'Health Sanitaris';
      case HealthInsuranceType.INTERCLINICAS_SAUDE:
        return 'Interclínicas Saúde';
      case HealthInsuranceType.MEDICAL_HEALTH:
        return 'Medical Health';
      case HealthInsuranceType.MED_TOUR_SAUDE:
        return 'Med Tour Saúde';
      case HealthInsuranceType.NOTRE_DAME_INTERMEDICA:
        return 'Notre Dame Intermédica';
      case HealthInsuranceType.PLANSAUDE:
        return 'PlanSaúde';
      case HealthInsuranceType.PLENA_SAUDE:
        return 'Plena Saúde';
      case HealthInsuranceType.PORTO_SEGURO_SAUDE:
        return 'Porto Seguro Saúde';
      case HealthInsuranceType.PREVENT_SENIOR:
        return 'Prevent Senior';
      case HealthInsuranceType.QSAUDE:
        return 'QSaúde';
      case HealthInsuranceType.SANTA_HELENA_SAUDE:
        return 'Santa Helena Saúde';
      case HealthInsuranceType.SAO_CRISTOVAO_SAUDE:
        return 'São Cristóvão Saúde';
      case HealthInsuranceType.SAO_MIGUEL_SAUDE:
        return 'São Miguel Saúde';
      case HealthInsuranceType.SEGUROS_UNIMED:
        return 'Seguros Unimed';
      case HealthInsuranceType.SOMPO_SAUDE:
        return 'Sompo Saúde';
      case HealthInsuranceType.SUL_AMERICA_SAUDE:
        return 'Sul América Saúde';
      case HealthInsuranceType.TOTAL_MEDCARE_SAUDE:
        return 'Total Medcare Saúde';
      case HealthInsuranceType.TRASMONTANO_SAUDE:
        return 'Trasmontano Saúde';
      case HealthInsuranceType.UNIHOSP_SAUDE:
        return 'Unihosp Saúde';
      case HealthInsuranceType.UNIMED:
        return 'Unimed';
      case HealthInsuranceType.SUS:
        return 'Sistema Único de Saúde';
    }
  }
}

const Map<String, HealthInsuranceType> ResponseHealthInsuranceTypeMap = {
  'ALLIANZ': HealthInsuranceType.ALLIANZ,
  'AMEPLAN': HealthInsuranceType.AMEPLAN,
  'AMIL_SAUDE': HealthInsuranceType.AMIL_SAUDE,
  'BIOSAUDE': HealthInsuranceType.BIOSAUDE,
  'BIOVIDA_SAUDE': HealthInsuranceType.BIOVIDA_SAUDE,
  'BLUE_MED_SAUDE': HealthInsuranceType.BLUE_MED_SAUDE,
  'BRADESCO_SAUDE': HealthInsuranceType.BRADESCO_SAUDE,
  'CLASSES_LABORIOSAS': HealthInsuranceType.CLASSES_LABORIOSAS,
  'CRUZ_AZUL_SAUDE': HealthInsuranceType.CRUZ_AZUL_SAUDE,
  'GS_SAUDE': HealthInsuranceType.GS_SAUDE,
  'GOLDEN_CROSS': HealthInsuranceType.GOLDEN_CROSS,
  'HAPVIDA': HealthInsuranceType.HAPVIDA,
  'HEALTH_SANITARIS': HealthInsuranceType.HEALTH_SANITARIS,
  'INTERCLINICAS_SAUDE': HealthInsuranceType.INTERCLINICAS_SAUDE,
  'MEDICAL_HEALTH': HealthInsuranceType.MEDICAL_HEALTH,
  'MED_TOUR_SAUDE': HealthInsuranceType.MED_TOUR_SAUDE,
  'NOTRE_DAME_INTERMEDICA': HealthInsuranceType.NOTRE_DAME_INTERMEDICA,
  'PLANSAUDE': HealthInsuranceType.PLANSAUDE,
  'PLENA_SAUDE': HealthInsuranceType.PLENA_SAUDE,
  'PORTO_SEGURO_SAUDE': HealthInsuranceType.PORTO_SEGURO_SAUDE,
  'PREVENT_SENIOR': HealthInsuranceType.PREVENT_SENIOR,
  'QSAUDE': HealthInsuranceType.QSAUDE,
  'SANTA_HELENA_SAUDE': HealthInsuranceType.SANTA_HELENA_SAUDE,
  'SAO_CRISTOVAO_SAUDE': HealthInsuranceType.SAO_CRISTOVAO_SAUDE,
  'SAO_MIGUEL_SAUDE': HealthInsuranceType.SAO_MIGUEL_SAUDE,
  'SEGUROS_UNIMED': HealthInsuranceType.SEGUROS_UNIMED,
  'SOMPO_SAUDE': HealthInsuranceType.SOMPO_SAUDE,
  'SUL_AMERICA_SAUDE': HealthInsuranceType.SUL_AMERICA_SAUDE,
  'TOTAL_MEDCARE_SAUDE': HealthInsuranceType.TOTAL_MEDCARE_SAUDE,
  'TRASMONTANO_SAUDE': HealthInsuranceType.TRASMONTANO_SAUDE,
  'UNIHOSP_SAUDE': HealthInsuranceType.UNIHOSP_SAUDE,
  'UNIMED': HealthInsuranceType.UNIMED,
  'SUS': HealthInsuranceType.SUS
};

const Map<HealthInsuranceType, String> RequestHealthInsuranceTypeMap = {
  HealthInsuranceType.ALLIANZ: 'ALLIANZ',
  HealthInsuranceType.AMEPLAN: 'AMEPLAN',
  HealthInsuranceType.AMIL_SAUDE: 'AMIL_SAUDE',
  HealthInsuranceType.BIOSAUDE: 'BIOSAUDE',
  HealthInsuranceType.BIOVIDA_SAUDE: 'BIOVIDA_SAUDE',
  HealthInsuranceType.BLUE_MED_SAUDE: 'BLUE_MED_SAUDE',
  HealthInsuranceType.BRADESCO_SAUDE: 'BRADESCO_SAUDE',
  HealthInsuranceType.CLASSES_LABORIOSAS: 'CLASSES_LABORIOSAS',
  HealthInsuranceType.CRUZ_AZUL_SAUDE: 'CRUZ_AZUL_SAUDE',
  HealthInsuranceType.GS_SAUDE: 'GS_SAUDE',
  HealthInsuranceType.GOLDEN_CROSS: 'GOLDEN_CROSS',
  HealthInsuranceType.HAPVIDA: 'HAPVIDA',
  HealthInsuranceType.HEALTH_SANITARIS: 'HEALTH_SANITARIS',
  HealthInsuranceType.INTERCLINICAS_SAUDE: 'INTERCLINICAS_SAUDE',
  HealthInsuranceType.MEDICAL_HEALTH: 'MEDICAL_HEALTH',
  HealthInsuranceType.MED_TOUR_SAUDE: 'MED_TOUR_SAUDE',
  HealthInsuranceType.NOTRE_DAME_INTERMEDICA: 'NOTRE_DAME_INTERMEDICA',
  HealthInsuranceType.PLANSAUDE: 'PLANSAUDE',
  HealthInsuranceType.PLENA_SAUDE: 'PLENA_SAUDE',
  HealthInsuranceType.PORTO_SEGURO_SAUDE: 'PORTO_SEGURO_SAUDE',
  HealthInsuranceType.PREVENT_SENIOR: 'PREVENT_SENIOR',
  HealthInsuranceType.QSAUDE: 'QSAUDE',
  HealthInsuranceType.SANTA_HELENA_SAUDE: 'SANTA_HELENA_SAUDE',
  HealthInsuranceType.SAO_CRISTOVAO_SAUDE: 'SAO_CRISTOVAO_SAUDE',
  HealthInsuranceType.SAO_MIGUEL_SAUDE: 'SAO_MIGUEL_SAUDE',
  HealthInsuranceType.SEGUROS_UNIMED: 'SEGUROS_UNIMED',
  HealthInsuranceType.SOMPO_SAUDE: 'SOMPO_SAUDE',
  HealthInsuranceType.SUL_AMERICA_SAUDE: 'SUL_AMERICA_SAUDE',
  HealthInsuranceType.TOTAL_MEDCARE_SAUDE: 'TOTAL_MEDCARE_SAUDE',
  HealthInsuranceType.TRASMONTANO_SAUDE: 'TRASMONTANO_SAUDE',
  HealthInsuranceType.UNIHOSP_SAUDE: 'UNIHOSP_SAUDE',
  HealthInsuranceType.UNIMED: 'UNIMED',
  HealthInsuranceType.SUS: 'SUS',
};
