part of dm_tool;

class SpecialWeapon {
  Rarity rarity;
  String weapon;
  num price = 0;

  Map<String, String> weapons = {
    'Adamantine Battleaxe' : '',
    'Adamantine Dagger' : '',
    'Aassassins Dagger' : '',
    'Dagger of Venom' : '',
    'Dwarven Thrower' : '',
    'Flame Tongue' : '',
    'Frost Brand' : '',
    'Holy Avenger' : '',
    'Javelin of Lightning' : '',
    'Life Drinker' : '',
    'Luck Blade' : '',
    'Mace of Smiting' : '',
    'Mace of Terror' : '',
    'Masterwork Cold Iron Longsword' : '',
    'Nine Lives Stealer' : '',
    'Oathbow' : '',
    'Rapier of Puncturing' : '',
    'Screaming Bolt' : '',
    'Shatterspike' : '',
    'Shifters Sorrow' : '',
    'Masterwork Silver Dagger' : '',
    'Sleep Arrow' : '',
    'Sunwrath' : '',
    'Sword of Life Stealing' : '',
    'Sword of the Fey' : '',
    'Sword of Subtlety' : '',
    'Sylvan Scimitar' : '',
    'True Bloodclaw' : '',
    'Trident of Waterbane' : '',
  };

  SpecialWeapon(this.rarity) {
    rollSpecialWeapon();
  }

  void rollSpecialWeapon() {
    int d100 = roll();
    switch (rarity) {
      case Rarity.VERY_COMMON:
      case Rarity.COMMON:
        //minor
        if (d100 < 16) {
          weapon = 'Sleep Arrow' + weapons['Sleep Arrow'];
          price = 132;
        }
        else if (d100 > 15 && d100 < 26) {
          weapon = 'Screaming Bolt' + weapons['Screaming Bolt'];
          price = 267;
        }
        else if (d100 > 25 && d100 < 46) {
          weapon = 'Masterwork Silver Dagger' + weapons['Masterwork Silver Dagger'];
          price = 322;
        }
        else if (d100 > 45 && d100 < 66) {
          weapon = 'Masterwork Cold Iron Longsword' + weapons['Masterwork Cold Iron Longsword'];
          price = 330;
        }
        else if (d100 > 65 && d100 < 76) {
          weapon = 'Javelin of Lightning' + weapons['Javelin of Lightning'];
          price = 1500;
        }
        else if (d100 > 75 && d100 < 81) {
          weapon = 'Slaying Arrow' + weapons['Slaying Arrow'];
          price = 2282;
        }
        else if (d100 > 80 && d100 < 91) {
          weapon = 'Adamantine Dagger' + weapons['3002'];
          price = 3002;
        }
        else if (d100 > 90 && d100 < 101) {
          weapon = 'Adamantine Battleaxe' + weapons['Adamantine Battleaxe'];
          price = 3010;
        }
        else {
          weapon = 'Something went wrong when rollong for common special weapon. Roll : $d100';
        }
        break;
      case Rarity.UNCOMMON:
      case Rarity.RARE:
        //medium
        if (d100 < 10) {
          weapon = 'Javelin of Lightning' + weapons['Javelin of Lightning'];
          price = 1500;
        }
        else if (d100 > 9 && d100 < 16) {
          weapon = 'Slaying Arrow' + weapons['Slaying Arrow'];
          price = 2282;
        }
        else if (d100 > 15 && d100 < 25) {
          weapon = 'Adamantine Dagger' + weapons['3002'];
          price = 3002;
        }
        else if (d100 > 24 && d100 < 34) {
          weapon = 'Adamantine Battleaxe' + weapons['Adamantine Battleaxe'];
          price = 3010;
        }
        else if (d100 > 33 && d100 < 38) {
          weapon = 'Greater Slaying Arrow (DC - )' + weapons['Slaying Arrow'];
          price = 4057;
        }
        else if (d100 > 37 && d100 < 41) {
          weapon = 'Shatterspike' + weapons['Shatterspike'];
          price = 4315;
        }
        else if (d100 > 40 && d100 < 47) {
          weapon = 'Dagger of Venom' + weapons['Dagger of Venom'];
          price = 8302;
        }
        break;
      case Rarity.VERY_RARE:
      case Rarity.LEGENDARY:
      //Major

        break;
    }
  }
}