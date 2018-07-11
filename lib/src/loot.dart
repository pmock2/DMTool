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
    totalLoot.writeln(simplifyCoin(sum));

    num halfPartyLevel = (partyLevel / 2).floor();
    halfPartyLevel = halfPartyLevel == 0 ? 1 : halfPartyLevel;


    switch(difficulty) {
      case 1:
        d100 = roll();
        if (d100 > 24 && d100 < 50) {
          totalLoot.writeln(getGem(Rarity.VERY_COMMON));
        }
        else if (d100 > 49 && d100 < 75) {
          totalLoot.writeln(getGem(Rarity.VERY_COMMON));
        }
        else if (d100 > 74 && d100 < 90 ) {
          totalLoot.writeln(getGem(Rarity.VERY_COMMON));
        }
        else if (d100 > 89 && d100 < 100) {
          totalLoot.writeln(getGem(Rarity.COMMON));
        }
        else if (d100 == 100) {
          totalLoot.writeln(getGem(Rarity.UNCOMMON));
        }
        break;
      case 2:
        for (int i = 0; i < roll(halfPartyLevel); i++) {
          d100 = roll();
          if (d100 < 25) {
            totalLoot.writeln(getGem(Rarity.VERY_COMMON));
          }
          else if (d100 > 24 && d100 < 50) {
            totalLoot.writeln(getGem(Rarity.VERY_COMMON));
          }
          else if (d100 > 49 && d100 < 75) {
            totalLoot.writeln(getGem(Rarity.VERY_COMMON));
          }
          else if (d100 > 74 && d100 < 90 ) {
            totalLoot.writeln(getGem(Rarity.COMMON));
          }
          else if (d100 > 89 && d100 < 100) {
            totalLoot.writeln(getGem(Rarity.UNCOMMON));
          }
          else if (d100 == 100) {
            totalLoot.writeln(getGem(Rarity.RARE));
          }
        }
        break;
      case 3:
        for (int i = 0; i < roll(halfPartyLevel); i++) {
          d100 = roll();
          if (d100 < 25) {
            totalLoot.writeln(getGem(Rarity.VERY_COMMON));
          }
          else if (d100 > 24 && d100 < 50) {
            totalLoot.writeln(getGem(Rarity.VERY_COMMON));
          }
          else if (d100 > 49 && d100 < 75) {
            totalLoot.writeln(getGem(Rarity.COMMON));
          }
          else if (d100 > 74 && d100 < 90 ) {
            totalLoot.writeln(getGem(Rarity.UNCOMMON));
          }
          else if (d100 > 89 && d100 < 100) {
            totalLoot.writeln(getGem(Rarity.RARE));
          }
          else if (d100 == 100) {
            totalLoot.writeln(getGem(Rarity.RARE));
          }
        }
        break;
      case 4:
        for (int i = 0; i < roll(halfPartyLevel); i++) {
          d100 = roll();
          if (d100 < 25) {
            totalLoot.writeln(getGem(Rarity.VERY_COMMON));
          }
          else if (d100 > 24 && d100 < 50) {
            totalLoot.writeln(getGem(Rarity.COMMON));
          }
          else if (d100 > 49 && d100 < 75) {
            totalLoot.writeln(getGem(Rarity.UNCOMMON));
          }
          else if (d100 > 74 && d100 < 90 ) {
            totalLoot.writeln(getGem(Rarity.RARE));
          }
          else if (d100 > 89 && d100 < 100) {
            totalLoot.writeln(getGem(Rarity.RARE));
          }
          else if (d100 == 100) {
            totalLoot.writeln(getGem(Rarity.LEGENDARY));
          }
        }
        break;
      case 5:
        for (int i = 0; i < roll(halfPartyLevel); i++) {
          d100 = roll();
          if (d100 < 25) {
            totalLoot.writeln(getGem(Rarity.VERY_COMMON));
          }
          else if (d100 > 24 && d100 < 50) {
            totalLoot.writeln(getGem(Rarity.COMMON));
          }
          else if (d100 > 49 && d100 < 75) {
            totalLoot.writeln(getGem(Rarity.UNCOMMON));
          }
          else if (d100 > 74 && d100 < 90 ) {
            totalLoot.writeln(getGem(Rarity.RARE));
          }
          else if (d100 > 89 && d100 < 100) {
            totalLoot.writeln(getGem(Rarity.RARE));
          }
          else if (d100 == 100) {
            totalLoot.writeln(getGem(Rarity.LEGENDARY));
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

  /*
       ---GEMS---
      very common - 20gp    - 60% (1-60)
      common      - 100gp   - 20% (61- 80)
      uncommon    - 350gp   - 10% (86-90)
      rare        - 1000gp   - 6%  (91-96)
      very rare   - 8000gp  - 3%  (97-99)
      legendary   - 20000gp - 1%  (100)
   */
  String getGem(Rarity rarity) {
    int gold;
    List gems;
    int gemIndex = roll(4) - 1;

    switch (rarity) {
      case Rarity.VERY_COMMON:
        gold = ((roll(4) + roll(4) + roll(4) + roll(4)) * 2);
        gems = ['azurite', 'blue quartz', 'lapis lazuli', 'obsidian'];
        break;
      case Rarity.COMMON:
        gold = (((roll(4)) + roll(4)) * 10 * 2);
        gems = ['bloodstone', 'jasper', 'moonstone', 'obsidian'];
        break;
      case Rarity.UNCOMMON:
        gold = ((roll(4) + roll(4) + roll(4) + roll(4)) * 10 * 3.5).floor();
        gems = ['amethyst', 'amber', 'coral', 'jade'];
        break;
      case Rarity.RARE:
        gold = (((roll(4)) + roll(4)) * 100 * 2);
        gems =
        ['aquamarine', 'alexandrite', 'black pearl', 'godlen yellow topaz'];
        break;
      case Rarity.VERY_RARE:
        gold = ((roll(4) + roll(4) + roll(4) + roll(4)) * 100) * 8;
        gems = ['emerald', 'fire opal', 'blue sapphire', 'star ruby'];
        break;
      case Rarity.LEGENDARY:
        gold = (((roll(4)) + roll(4)) * 1000 * 20);
        gems = ['large diamond', 'clear white pearl', 'meteor shard', 'clear emerald'];
    }

    return gems[gemIndex] + '(' + gold.toString() + ' gold)';
  }

  String getWeapon(Rarity rarity) {
    Weapon weapon = new Weapon(rarity);
    return weapon.getWeapon();
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
