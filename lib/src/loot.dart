part of dm_tool;

class Loot {
  /**
   * Party level - raw modifier for loot table
   * Difficulty - Value 1-5 where 5 is the hardest and 1 is the easiest. Raw modifier for loot table;
   */
  int partyLevel, difficulty;

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

      if (d100 < 25)

    }
    else {

    }
  }
}
