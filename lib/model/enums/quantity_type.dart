enum QuantityType {
  pill,
  capsule,
  drops,
  ml,
  mg,
  g
}

extension QuantityTypeExtension on QuantityType {
  String get description {
    switch (this) {
      case QuantityType.pill:
        return 'comprimido(s)';
      case QuantityType.capsule:
        return 'cápsula(s)';
      case QuantityType.drops:
        return 'gota(s)';
      case QuantityType.ml:
        return 'ml';
      case QuantityType.mg:
        return 'mg';
      case QuantityType.g:
        return 'g';
    }
  }
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
