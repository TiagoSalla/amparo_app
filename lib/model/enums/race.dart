enum Race {
  white,
  black,
  brown,
  yellow,
  indigenous
}

const Map<String, Race> ResponseRaceMap = {
  'WHITE': Race.white,
  'BLACK': Race.black,
  'BROWN': Race.brown,
  'YELLOW': Race.yellow,
  'INDIGENOUS': Race.indigenous
};

const Map<Race, String> RequestRaceMap = {
  Race.white: 'WHITE',
  Race.black: 'BLACK',
  Race.brown: 'BROWN',
  Race.yellow: 'YELLOW',
  Race.indigenous: 'INDIGENOUS'
};
