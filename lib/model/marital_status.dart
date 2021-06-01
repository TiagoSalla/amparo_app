enum MaritalStatus {
  single,
  married,
  widow,
  separated,
  divorced
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