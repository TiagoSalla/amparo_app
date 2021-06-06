class Session {
  static final Session _session = Session._internal();

  factory Session() => _session;

  Session._internal();

  static Session get shared => _session;

  String username = "";
  String asylumName = "";
}