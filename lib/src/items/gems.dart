part of dm_tool;

class Gem {
  Rarity rarity;

  String gem;

  Gem(this.rarity) {
    getGem();
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
  void getGem() {
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
    gem = gems[gemIndex] + ' (' + gold.toString() + ' gold)';
  }
}