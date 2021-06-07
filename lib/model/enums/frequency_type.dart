enum FrequencyType {
  minutes,
  hours,
  days
}

extension FrequencyTyperExtension on FrequencyType {
  String get description {
    switch (this) {
      case FrequencyType.minutes:
        return 'minuto(s)';
      case FrequencyType.hours:
        return 'hora(s)';
      case FrequencyType.days:
        return 'dia(s)';
    }
  }
}

const Map<String, FrequencyType> ResponseFrequencyTypeMap = {
  'MINUTES': FrequencyType.minutes,
  'HOURS': FrequencyType.hours,
  'DAYS': FrequencyType.days
};

const Map<FrequencyType, String> RequestFrequencyTypeMap = {
  FrequencyType.minutes: 'MINUTES',
  FrequencyType.hours: 'HOURS',
  FrequencyType.days: 'DAYS'
};
