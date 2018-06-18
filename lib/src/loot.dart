part of dm_tool;

enum Difficulty {veryEasy, easy , medium, hard, veryHard}

class Loot {
  /**
   * Party level - raw modifier for loot table
   * Difficulty - Value 1-5 where 5 is the hardest and 1 is the easiest. Raw modifier for loot table;
   */
  int partyLevel;

  Difficulty difficulty;

  int check = 0;

  String loot;

  bool includeItem, isPickPocket;

  Random r = new Random();

  Loot(this.partyLevel, this.difficulty, [this.check, this.includeItem = false, this.isPickPocket = false]) {
    getLoot();
  }

  /*
    ---COIN---

    platinum = 1000 gp, 10000 sp, 100000 cp
    gold     = 10 sp, 100 cp
    silver   = 10 cp
    copper   = 1/10 sp

    ---GEMS---
    very common - 20gp    - 60% (1-60)
    common      - 100gp   - 20% (61- 80)
    uncommon    - 350gp   - 10% (86-90)
    rare        - 800gp   - 6%  (91-96)
    very rare   - 8000gp  - 3%  (97-99)
    legendary   - 20000gp - 1%  (100)

  */

  int roll([int max = 100]) {
    int min = 1;
    return min + r.nextInt(max - min);
  }

  void getLoot() {
    if (isPickPocket) {
      int d100 = roll();
      num sum = 0;
      if (d100 < 25) {
        sum = (d100 * partyLevel + (1 * check));
        loot = simplifyCoin(sum.floor());
      }
      else if (d100 > 24 && d100 < 50) {
        sum = (d100 * partyLevel + (1.25 * check));
        loot = simplifyCoin(sum.floor());
      }
      else if (d100 > 49 && d100 < 75) {
        sum = (d100 * partyLevel + (1.5 * check));
        loot = simplifyCoin(sum.floor());
      }
      else if (d100 > 74 && d100 < 90 ) {
        sum = (d100 * partyLevel + (1.75 * check));
        loot = simplifyCoin(sum.floor());
      }
      else if (d100 > 89 && d100 < 100) {
        sum = (d100 * partyLevel + (2 * check));
        loot = simplifyCoin(sum.floor());
      }
      else if (d100 == 100) {
        sum = (d100 * partyLevel + (5 * check));
        loot = simplifyCoin(sum.floor());
      }
      else {
        print('Something went wrong when rolling pick pocket. Roll : $d100');
      }
    }
    else {

    }
  }

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

  String getGem(int rarity) {

  }

}
