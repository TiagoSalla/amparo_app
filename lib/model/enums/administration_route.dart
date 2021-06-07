enum AdministrationRoute {
  oral,
  parental,
  subcutaneous,
  nasal,
  rectal,
  intravesical,
  nebulization,
  ocular,
  sublingual,
}

extension AdministrationRouteExtension on AdministrationRoute {
  String get description {
    switch (this) {
      case AdministrationRoute.oral:
        return 'Oral';
      case AdministrationRoute.parental:
        return 'Parental';
      case AdministrationRoute.subcutaneous:
        return 'Subcutânea';
      case AdministrationRoute.nasal:
        return 'Nasal';
      case AdministrationRoute.rectal:
        return 'Retal';
      case AdministrationRoute.intravesical:
        return 'Intravesical';
      case AdministrationRoute.nebulization:
        return 'Nebulização';
      case AdministrationRoute.ocular:
        return 'Ocular';
      case AdministrationRoute.sublingual:
        return 'Sublingual';
    }
  }
}

const Map<String, AdministrationRoute> ResponseAdministrationRouteMap = {
  'ORAL': AdministrationRoute.oral,
  'PARENTAL': AdministrationRoute.parental,
  'SUBCUTANEOUS': AdministrationRoute.subcutaneous,
  'NASAL': AdministrationRoute.nasal,
  'RECTAL': AdministrationRoute.rectal,
  'INTRAVESICAL': AdministrationRoute.intravesical,
  'NEBULIZATION': AdministrationRoute.nebulization,
  'OCULAR': AdministrationRoute.ocular,
  'SUBLINGUAL': AdministrationRoute.sublingual
};

const Map<AdministrationRoute, String> RequestAdministrationRouteMap = {
  AdministrationRoute.oral: 'ORAL',
  AdministrationRoute.parental: 'PARENTAL',
  AdministrationRoute.subcutaneous: 'SUBCUTANEOUS',
  AdministrationRoute.nasal: 'NASAL',
  AdministrationRoute.rectal: 'RECTAL',
  AdministrationRoute.intravesical: 'INTRAVESICAL',
  AdministrationRoute.nebulization: 'NEBULIZATION',
  AdministrationRoute.ocular: 'OCULAR',
  AdministrationRoute.sublingual: 'SUBLINGUAL'
};
