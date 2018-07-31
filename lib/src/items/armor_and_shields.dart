part of dm_tool;

class ArmorOrShield {
  Rarity rarity;

  String name;

  String ability;

  String value;

  StringBuffer finalString = new StringBuffer();

  Map shields = new Map();
  Map armor = new Map();

  Map lowShields = new Map();
  Map midShields = new Map();
  Map highShields = new Map();

  Map lowArmor = new Map();
  Map midArmor = new Map();
  Map highArmor = new Map();

  ArmorOrShield(this.rarity) {
    getArmorOrShield();
    buildTables();
  }

  void getArmorOrShield() {
    int d100 = roll();
    if (d100 > 50) {
      getArmor();
    }
    else {
      getShield();
    }
  }

  void getShield() {

  }

  void getArmor() {

  }

  void buildTables() {
    void buildShields() {
      void buildLowShields() {

      }
      void buildMidShields() {

      }
      void buildHighShields() {

      }

      buildLowShields();
      buildMidShields();
      buildHighShields();
    }

    void buildArmor() {
      void buildLowArmor() {

      }
      void buildMidArmor() {

      }
      void buildHighArmor() {

      }

      buildLowArmor();
      buildMidArmor();
      buildHighArmor();
    }

    buildShields();
    buildArmor();
  }

  void storeObjects(Rarity rarity, String description, int min, int max, {bool armor = false, bool shield = false}) {
    Map tempMap = new Map();
    for (int i = min; i <= max; i++) {
      tempMap[i.toString()] = description;
    }

    switch (rarity) {
      case Rarity.VERY_COMMON:
        if (armor) {
          lowArmor.addAll(tempMap);
        }
        else if (shield) {
          lowShields.addAll(tempMap);
        }
        break;
      case Rarity.COMMON:
        if (armor) {
          lowArmor.addAll(tempMap);
        }
        else if (shield) {
          lowShields.addAll(tempMap);
        }
        break;
      case Rarity.UNCOMMON:
        if (armor) {
          midArmor.addAll(tempMap);
        }
        else if (shield) {
          midShields.addAll(tempMap);
        }
        break;
      case Rarity.RARE:
        if (armor) {
          midArmor.addAll(tempMap);
        }
        else if (shield) {
          midShields.addAll(tempMap);
        }
        break;
      case Rarity.VERY_RARE:
        if (armor) {
          highArmor.addAll(tempMap);
        }
        else if (shield) {
          highShields.addAll(tempMap);
        }
        break;
      case Rarity.LEGENDARY:
        if (armor) {
          highArmor.addAll(tempMap);
        }
        else if (shield) {
          highShields.addAll(tempMap);
        }
        break;
    }
  }

}