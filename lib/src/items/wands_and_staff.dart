part of dm_tool;

class WandOrStaff {
  Rarity rarity;

  String name;

  String ability;

  String value;

  StringBuffer finalString = new StringBuffer();

  Map lowWands = new Map();
  Map midWands = new Map();
  Map highWands = new Map();

  Map lowStaffs = new Map();
  Map midStaffs = new Map();
  Map highStaffs = new Map();

  WandOrStaff(this.rarity) {
    getWandOrStaff();
    buildTables();
  }

  void getWandOrStaff() {
    int d100 = roll();
    if (d100 > 50) {
      getStaff();
    }
    else {
      getWand();
    }
  }

  void getWand() {

  }

  void getStaff() {

  }

  void buildTables() {
    void buildWands() {
      void buildLowWands() {

      }
      void buildMidWands() {

      }
      void buildHighWands() {

      }

      buildLowWands();
      buildMidWands();
      buildHighWands();
    }

    void buildStaffs() {
      void buildLowStaffs() {

      }
      void buildMidStaffs() {

      }
      void buildHighStaffs() {

      }

      buildLowStaffs();
      buildMidStaffs();
      buildHighStaffs();
    }

    buildWands();
    buildStaffs();
  }

  void storeObjects(Rarity rarity, String description, int min, int max, {bool staff = false, bool wand = false}) {
    Map tempMap = new Map();
    for (int i = min; i <= max; i++) {
      tempMap[i.toString()] = description;
    }

    switch (rarity) {
      case Rarity.VERY_COMMON:
        if (staff) {
          lowStaffs.addAll(tempMap);
        }
        else if (wand) {
          lowWands.addAll(tempMap);
        }
        break;
      case Rarity.COMMON:
        if (staff) {
          lowStaffs.addAll(tempMap);
        }
        else if (wand) {
          lowWands.addAll(tempMap);
        }
        break;
      case Rarity.UNCOMMON:
        if (staff) {
          midStaffs.addAll(tempMap);
        }
        else if (wand) {
          midWands.addAll(tempMap);
        }
        break;
      case Rarity.RARE:
        if (staff) {
          midStaffs.addAll(tempMap);
        }
        else if (wand) {
          midWands.addAll(tempMap);
        }
        break;
      case Rarity.VERY_RARE:
        if (staff) {
          highStaffs.addAll(tempMap);
        }
        else if (wand) {
          highWands.addAll(tempMap);
        }
        break;
      case Rarity.LEGENDARY:
        if (staff) {
          highStaffs.addAll(tempMap);
        }
        else if (wand) {
          highWands.addAll(tempMap);
        }
        break;
    }
  }

}