enum Race { white, black, brown, yellow, indigenous }

extension RaceExtension on Race {
  String get description {
    switch (this) {
      case Race.white:
        return 'Branca';
      case Race.black:
        return 'Preta';
      case Race.brown:
        return 'Parda';
      case Race.yellow:
        return 'Amarela';
      case Race.indigenous:
        return 'Indígena';
    }
  }
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
