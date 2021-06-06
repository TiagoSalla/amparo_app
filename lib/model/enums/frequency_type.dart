enum FrequencyType {
  minutes,
  hours,
  days
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
