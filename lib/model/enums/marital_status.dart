enum MaritalStatus {
  single,
  married,
  widow,
  separated,
  divorced
}

extension MaritalStatusExtension on MaritalStatus {
  String get description {
    switch (this) {
      case MaritalStatus.single:
        return 'Solteiro(a)';
      case MaritalStatus.married:
        return 'Casado(a)';
      case MaritalStatus.widow:
        return 'Viúvo(a)';
      case MaritalStatus.separated:
        return 'Separado(a)';
      case MaritalStatus.divorced:
        return 'Divorciado(a)';
    }
  }
}

const Map<String, MaritalStatus> ResponseMaritalStatusMap = {
  'SINGLE': MaritalStatus.single,
  'MARRIED': MaritalStatus.married,
  'WIDOW': MaritalStatus.widow,
  'SEPARATED': MaritalStatus.separated,
  'DIVORCED': MaritalStatus.divorced
};

const Map<MaritalStatus, String> RequestMaritalStatusMap = {
  MaritalStatus.single: 'SINGLE',
  MaritalStatus.married: 'MARRIED',
  MaritalStatus.widow: 'WIDOW',
  MaritalStatus.separated: 'SEPARATED',
  MaritalStatus.divorced: 'DIVORCED'
};
