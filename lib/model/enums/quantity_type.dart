enum QuantityType {
  pill,
  capsule,
  drops,
  ml,
  mg,
  g
}

const Map<String, QuantityType> ResponseQuantityTypeMap = {
  'PILL': QuantityType.pill,
  'CAPSULE': QuantityType.capsule,
  'DROPS': QuantityType.drops,
  'ML': QuantityType.ml,
  'MG': QuantityType.mg,
  'G': QuantityType.g
};

const Map<QuantityType, String> RequestQuantityTypeMap = {
  QuantityType.pill: 'PILL',
  QuantityType.capsule: 'CAPSULE',
  QuantityType.drops: 'DROPS',
  QuantityType.ml: 'ML',
  QuantityType.mg: 'MG',
  QuantityType.g: 'G'
};
