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
