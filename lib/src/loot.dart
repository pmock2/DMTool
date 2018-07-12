part of dm_tool;

class Loot {
  /**
   * Party level - raw modifier for loot table
   * Difficulty - Value 1-5 where 5 is the hardest and 1 is the easiest. Raw modifier for loot table;
   */
  int partyLevel;

  int difficulty;

  int check = 0;

  String result;

  bool includeItem, isPickPocket;

  Loot(this.partyLevel, {this.check = 0, this.includeItem = false, this.isPickPocket = false, this.difficulty = 1,});

  void getLoot() {
    if (isPickPocket) {
      getPickPocket();
    }
    else {
      getEncounterLoot();
    }
  }

  void getEncounterLoot() {
    int d100 = roll();
    int sum = 0;
    StringBuffer totalLoot = new StringBuffer();

    sum = (d100 * difficulty) * (partyLevel * difficulty) * 100;
    totalLoot.writeln('<br>' + simplifyCoin(sum));

    num halfPartyLevel = (partyLevel / 2).floor();
    halfPartyLevel = halfPartyLevel == 0 ? 1 : halfPartyLevel;


    switch(difficulty) {
      case 1:
        d100 = roll();
        if (d100 < 90 ) {
          totalLoot.writeln('<br>' + getGem(Rarity.VERY_COMMON));
        }
        else if (d100 > 89 && d100 < 100) {
          totalLoot.writeln('<br>' + getGem(Rarity.COMMON));
          totalLoot.writeln('<br>' + getWeapon(Rarity.COMMON));
        }
        else if (d100 == 100) {
          totalLoot.writeln('<br>' + getGem(Rarity.UNCOMMON));
          totalLoot.writeln('<br>' + getWeapon(Rarity.UNCOMMON));
        }
        break;
      case 2:
        for (int i = 0; i < roll(halfPartyLevel); i++) {
          d100 = roll();
          if (d100 < 25) {
            totalLoot.writeln('<br>' + getGem(Rarity.VERY_COMMON));
          }
          else if (d100 > 24 && d100 < 50) {
            totalLoot.writeln('<br>' + getGem(Rarity.VERY_COMMON));
            totalLoot.writeln('<br>' + getWeapon(Rarity.VERY_COMMON));
          }
          else if (d100 > 49 && d100 < 75) {
            totalLoot.writeln('<br>' + getGem(Rarity.VERY_COMMON));
            totalLoot.writeln('<br>' + getWeapon(Rarity.VERY_COMMON));
          }
          else if (d100 > 74 && d100 < 90 ) {
            totalLoot.writeln('<br>' + getGem(Rarity.COMMON));
            totalLoot.writeln('<br>' + getWeapon(Rarity.COMMON));
          }
          else if (d100 > 89 && d100 < 100) {
            totalLoot.writeln('<br>' + getGem(Rarity.UNCOMMON));
            totalLoot.writeln('<br>' + getWeapon(Rarity.UNCOMMON));
          }
          else if (d100 == 100) {
            totalLoot.writeln('<br>' + getGem(Rarity.RARE));
            totalLoot.writeln('<br>' + getWeapon(Rarity.RARE));
          }
        }
        break;
      case 3:
        for (int i = 0; i < roll(halfPartyLevel); i++) {
          d100 = roll();
          if (d100 < 25) {
            totalLoot.writeln('<br>' + getGem(Rarity.VERY_COMMON));
            totalLoot.writeln('<br>' + getWeapon(Rarity.VERY_COMMON));
          }
          else if (d100 > 24 && d100 < 50) {
            totalLoot.writeln('<br>' + getGem(Rarity.COMMON));
            totalLoot.writeln('<br>' + getWeapon(Rarity.VERY_COMMON));
          }
          else if (d100 > 49 && d100 < 75) {
            totalLoot.writeln('<br>' + getGem(Rarity.UNCOMMON));
            totalLoot.writeln('<br>' + getWeapon(Rarity.UNCOMMON));
          }
          else if (d100 > 74 && d100 < 90 ) {
            totalLoot.writeln('<br>' + getGem(Rarity.UNCOMMON));
            totalLoot.writeln('<br>' + getWeapon(Rarity.UNCOMMON));
          }
          else if (d100 > 89 && d100 < 100) {
            totalLoot.writeln('<br>' + getGem(Rarity.RARE));
            totalLoot.writeln('<br>' + getWeapon(Rarity.RARE));
          }
          else if (d100 == 100) {
            totalLoot.writeln('<br>' + getGem(Rarity.VERY_RARE));
            totalLoot.writeln('<br>' + getWeapon(Rarity.VERY_RARE));
          }
        }
        break;
      case 4:
        for (int i = 0; i < roll(halfPartyLevel); i++) {
          d100 = roll();
          if (d100 < 25) {
            totalLoot.writeln('<br>' + getGem(Rarity.VERY_COMMON));
            totalLoot.writeln('<br>' + getWeapon(Rarity.VERY_COMMON));
          }
          else if (d100 > 24 && d100 < 50) {
            totalLoot.writeln('<br>' + getGem(Rarity.COMMON));
            totalLoot.writeln('<br>' + getWeapon(Rarity.COMMON));
          }
          else if (d100 > 49 && d100 < 75) {
            totalLoot.writeln('<br>' + getGem(Rarity.UNCOMMON));
            totalLoot.writeln('<br>' + getWeapon(Rarity.UNCOMMON));
          }
          else if (d100 > 74 && d100 < 90 ) {
            totalLoot.writeln('<br>' + getGem(Rarity.RARE));
            totalLoot.writeln('<br>' + getWeapon(Rarity.RARE));
          }
          else if (d100 > 89 && d100 < 100) {
            totalLoot.writeln('<br>' + getGem(Rarity.VERY_RARE));
            totalLoot.writeln('<br>' + getWeapon(Rarity.VERY_RARE));
          }
          else if (d100 == 100) {
            totalLoot.writeln('<br>' + getGem(Rarity.LEGENDARY));
            totalLoot.writeln('<br>' + getWeapon(Rarity.LEGENDARY));
          }
        }
        break;
      case 5:
        for (int i = 0; i < roll(halfPartyLevel); i++) {
          d100 = roll();
          if (d100 < 25) {
            totalLoot.writeln('<br>' + getGem(Rarity.COMMON));
            totalLoot.writeln('<br>' + getWeapon(Rarity.COMMON));
          }
          else if (d100 > 24 && d100 < 50) {
            totalLoot.writeln('<br>' + getGem(Rarity.UNCOMMON));
            totalLoot.writeln('<br>' + getWeapon(Rarity.UNCOMMON));
          }
          else if (d100 > 49 && d100 < 75) {
            totalLoot.writeln('<br>' + getGem(Rarity.RARE));
            totalLoot.writeln('<br>' + getWeapon(Rarity.RARE));
          }
          else if (d100 > 74 && d100 < 90 ) {
            totalLoot.writeln('<br>' + getGem(Rarity.VERY_RARE));
            totalLoot.writeln('<br>' + getWeapon(Rarity.VERY_RARE));
          }
          else if (d100 > 89 && d100 < 100) {
            totalLoot.writeln('<br>' + getGem(Rarity.LEGENDARY));
            totalLoot.writeln('<br>' + getWeapon(Rarity.LEGENDARY));
          }
          else if (d100 == 100) {
            totalLoot.writeln('<br>' + getGem(Rarity.LEGENDARY));
            totalLoot.writeln('<br>' + getWeapon(Rarity.LEGENDARY));
          }
        }
        break;
    }
    result = totalLoot.toString();
  }

  void getPickPocket() {
    int d100 = roll();
    num sum = 0;
    if (d100 < 25) {
      sum = (d100 * partyLevel + (1 * check));
      result = simplifyCoin(sum.floor());
    }
    else if (d100 > 24 && d100 < 50) {
      sum = (d100 * partyLevel + (1.25 * check));
      result = simplifyCoin(sum.floor());
    }
    else if (d100 > 49 && d100 < 75) {
      sum = (d100 * partyLevel + (1.5 * check));
      result = simplifyCoin(sum.floor());
    }
    else if (d100 > 74 && d100 < 90 ) {
      sum = (d100 * partyLevel + (1.75 * check));
      result = simplifyCoin(sum.floor());
    }
    else if (d100 > 89 && d100 < 100) {
      sum = (d100 * partyLevel + (2 * check));
      result = simplifyCoin(sum.floor());
    }
    else if (d100 == 100) {
      sum = (d100 * partyLevel + (5 * check));
      result = simplifyCoin(sum.floor());
    }
    else {
      print('Something went wrong when rolling pick pocket. Roll : $d100');
    }
  }

  /*
    ---COIN---
    platinum = 1000 gp, 10000 sp, 100000 cp
    gold     = 10 sp, 100 cp
    silver   = 10 cp
    copper   = 1/10 sp

  */
  String simplifyCoin(num sum) {
    num workingSum = sum;
    String plat = '';
    String gold = '';
    String silver = '';
    String copper = '';

    plat = (workingSum / 100000).floor().toString();

    if (num.parse(plat) > 0) {
      workingSum -= (num.parse(plat) * 100000);
    }

    gold = (workingSum / 100).floor().toString();

    if (num.parse(gold) > 0) {
      workingSum -= (num.parse(gold) * 100);
    }

    silver = (workingSum / 10).floor().toString();

    if (num.parse(silver) > 0) {
      workingSum -= (num.parse(silver) * 10);
    }

    copper = workingSum.toString();

    String platString = plat == '0' ? '' : '\n$plat platinum ';
    String goldString = gold == '0' ? '' : '\n$gold gold ';
    String silverString = silver == '0' ? '' : '\n$silver silver ';
    String copperString = copper == '0' ? '' : '\n$copper copper ';

    return platString + goldString + silverString + copperString;

  }
  
  String getGem(Rarity rarity) {
    Gem gem = new Gem(rarity);
    return gem.gem;
  }

  String getWeapon(Rarity rarity) {
    Weapon weapon = new Weapon(rarity);
    weapon.assignWeapon();
    return weapon.weapon;
  }

  String getArmor() {
    String loot;
    return loot;
  }

  String getStaffAndWand() {
    String loot;
    return loot;
  }

  String getWondrousItem() {
    String loot;
    return loot;
  }
}
