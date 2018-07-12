part of dm_tool;

class Weapon {
  int mod = 0;
  num price = 0;
  String description;
  String name = '';
  String enchantment;
  Rarity rarity;
  StringBuffer specialAbilities = new StringBuffer();
  int type;
  bool isMelee = true;
  bool hasWeaponType = false;
  String weapon;

  Map<String, String> abilities = {
    "Anarchic" : 'An anarchic weapon is chaotically aligned and infused with the power of chaos. It makes theweapon chaos-aligned. It deals an extra 2d6 points of damage against all of lawfulalignment. ',

    "Axiomatic" : 'An axiomatic weapon is lawfully aligned and infused with the power of law. It makes the weaponlaw-aligned. It deals an extra 2d6points of damage against all of chaotic alignment. ',

    "Bane" : 'A bane weapon excels at attacking one type or subtype of creature. Against its designated foe, its effective enhancement bonus is +2 better than its normal enhancement bonus. It deals an extra 2d6 points of damage against the foe. Bows, crossbows, and slings so crafted bestow the bane quality upon their ammunition. ',

    "Brilliant Energy" : 'A brilliant energy weapon has its significant portion transformed into light, although this does not modify the item’s weight. It always gives off light as a torch (20-foot radius). A brilliant energy weapon ignores nonliving matter. Armor and shield bonuses to AC (including any enhancement bonuses to that armor) do not count against it because the weapon passes through armor. (Dexterity, deflection, dodge, natural armor, and other such bonuses still apply.) A brilliant energy weapon cannot harm undead, constructs, and objects. ',

    "Dancing" : 'As a standard action, a dancing weapon can be loosed to attack on its own. It fights for 4 rounds using the base attack bonus of the one who loosed it and then drops. While dancing, it cannot make attacks of opportunity, and the person who activated it is not considered armed with the weapon. In all other respects, it is considered wielded or attended by the creature for all maneuvers and effects that target items. While dancing, it takes up the same space as the activating character and can attack adjacent foes (weapons with reach can attack opponents up to 10 feet away). The dancing weapon accompanies the person who activated it everywhere, whether she moves by physical or magical means. If the wielder who loosed it has an unoccupied hand, she can grasp it while it is attacking on its own as a free action; when so retrieved the weapon can’t dance (attack on its own) again for 4 rounds. ',

    "Defending" : 'A defending weapon allows the wielder to transfer some or all of the sword’s enhancement bonus to his AC as a bonus that stacks with all others. As a free action, the wielder chooses how to allocate the weapon’s enhancement bonus at the start of his turn before using the weapon, and the effect to AC lasts until his next turn. ',

    "Disruption" : 'A weapon of disruption is the bane of all undead. Any undead creature struck in combat must succeed on a DC 12 Wisdom save or be destroyed. ',

    "Distance" : 'A weapon of distance has double the range increment of other weapons of its kind.  ',

    "Flaming" : 'Upon command, a flaming weapon is sheathed in fire. The fire does not harm the wielder. The effect remains until another command is given. A flaming weapon deals an extra 1d6 points of fire damage on a successful hit. Bows, crossbows, and slings so crafted bestow the fire energy upon their ammunition. ',

    "Flaming Burst" : 'A flaming burst weapon functions as a flaming weapon that also explodes with flame. The fire does not harm the wielder. It deals an extra 1d6 points of fire damage on a successful hit, and once per day can explode into flame in a 10 foot radius to deal 2d10 damage to all creatures within range (except the wielder) ',

    "Frost" : 'Upon command, a frost weapon is sheathed in icy cold. The cold does not harm the wielder. The effect remains until another command is given. A frost weapon deals an extra 1d6 points of cold damage on a successful hit. Bows, crossbows, and slings so crafted bestow the cold energy upon their ammunition. ',

    "Ghost Touch" : 'Deal an extra 2d6 damage against incorpreal creatures ',

    "Holy" : 'A holy weapon is imbued with holy power. This power makes the weapon good-aligned and deals an extra 2d6 points of damage against all of evil alignment. ',

    "Icy Burst" : 'An icy burst weapon functions as a forst weapon that also explodes with ice. The ice does not harm the wielder. It deals an extra 1d6 points of ice damage on a successful hit, and once per day can explode into ice crystals in a 10 foot radius to deal 2d10 damage to all creatures within range (except the wielder) ',

    "Bloodclaw" : 'A bloodclaw weapon demands blood. When gripping a bloodclaw weapon, a fleshy membrane bonds with its weilder. Dropping the weapon requires the membrane to be torn off, dealinig 1d6 damage to the wielder. Each time the bloodclaw weapon damages an enemy, it deals an additional 2d6 damage. However, each turn it damages the wielder 1d6 damage. ',

    "Ki Focus" : 'The magic weapon serves as a channel for the wielder’s ki, allowing her to use her special ki attacks through the weapon as if they were unarmed attacks. ',

    "Merciful" : 'The weapon deals an extra 1d6 points of damage, and all damage it deals is nonlethal damage. On command, the weapon suppresses this ability until commanded to resume it. ',

    "Mighty Cleaving" : 'A cleaving weapon is given an extended reach, allowing it two hit two target in one swoop as the targets are within 5 feet of one another. Each target recieves its own attack and damage rolls. ',

    "Returning" : 'A returning weapon flies through the air back to the creature that threw it. It returns to the thrower just before the creature’s next turn (and is therefore ready to use again in that turn). Catching a returning weapon when it comes back is a free action. If the character can’t catch it, or if the character has moved since throwing it, the weapon drops to the ground in the square from which it was thrown. ',

    "Seeking" : 'A seeking weapon gives its projectiles the ability to ignore concealment, as the project has the ability to bend and move while in motion ',

    "Shock" : 'Upon command, a shock weapon is sheathed in crackling electricity. The electricity does not harm the wielder. The effect remains until another command is given. A shock weapon deals an extra 1d6 points of lightning damage on a successful hit. ',

    "Shocking Burst" : 'A shocking burst weapon functions as a shock weapon that also explodes with electricity. The electricity does not harm the wielder. It deals an extra 1d6 points of lightning damage on a successful hit, and once per day can explode into lightning in a 10 foot radius to deal 2d10 damage to all creatures within range (except the wielder) ',

    "Speed" : 'When making a full attack action, the wielder of a speed weapon may make one extra attack with it. The attack uses the wielder’s full base attack bonus, plus any modifiers appropriate to the situation. ',

    "Spell Storing" : 'Allows the storing of one spell of up to 3rd level into the weaspon. A spellcaster must know the spell that is stored in the weaspon, and once the spell is used the spellcaster must re-charge the weapon with teh same or another spell. it takes 1 hour to store a spell within the weapn. ',

    "Thundering" : 'Once per day, a thundering weapon can explode with a mighty bang that deals 2d8 damage to all createus within a 50 foot radius. The wielder takes no damage. ',

    "Throwing" : 'Allows a normal melee weapon to become ranged with a distance of 15 feet. The wielder can use their proficiency when throwing the weapon if they had proficiency with its weapon type prior. ',

    "Unholy" : 'An unholy weapon is imbued with unholy power. This power makes the weapon evil-aligned. It deals an extra 2d6 points of damage against all of good alignment. ',

    "Vicious" : 'When a vicious weapon strikes an opponent, it creates a flash of disruptive energy that resonates between the opponent and the wielder. This energy deals an extra 2d6 points of damage to the opponent and 1d4 points of damage to the wielder. ',

    "Vorpal" : 'Upon a roll of natural 20 (followed by a successful roll to confirm the critical hit), the target must succeed a DC 14 Dexterity Save. On a failed save, the weapon severs the opponent’s head (if it has one) from its body ',

    "Wounding" : 'A wounding weapon gives the target the "bleeding" status on a critical hit ',
  };

  Weapon(this.rarity);

  void assignWeapon() {
    getWeaponStats();
    StringBuffer weaponBuffer = new StringBuffer();
    if (price == 0 && name.isEmpty) {
      print('Something bad happened');
    }
    if (mod != 0) {
      weaponBuffer.write('+' + mod.toString() + ' ');
    }
    weaponBuffer.write(name);
    if (specialAbilities.toString().isNotEmpty) {
      weaponBuffer.writeln('<br> Abilities: ' + specialAbilities.toString());
    }
    weaponBuffer.writeln('<br> - ${price} GP');
    weapon = weaponBuffer.toString();
  }

  void getWeaponStats() {
    int d100 = roll();
    switch (rarity) {
      case Rarity.VERY_COMMON:
      case Rarity.COMMON:
      //minor
        if (d100 < 50) {
          name = getWeaponType();
        }
        else if (d100 > 49 && d100 < 71) {
          name = getWeaponType();
          mod += 1;
          price += 2000;
        }
        else if (d100 > 70 && d100 < 86) {
          name = getWeaponType();
          mod += 2;
          price += 8000;
        }
        else if (d100 > 85 && d100 < 91) {
          //roll for special weapon
          name = 'some special weapon';
          hasWeaponType = true;
        }
        else if (d100 > 90 && d100 < 101) {
          //re-roll then add special ability
          getWeaponStats();
          if (hasWeaponType) {
            if (isMelee) {
              addMeleeSpecialAbility();
            }
            else {
              addRangedSpecialAbility();
            }
          }
          else {
            print('Rolled special ability but no weapon type was found');
          }
        }
        break;
      case Rarity.UNCOMMON:
      case Rarity.RARE:
      //medium
        if (d100 < 3) {
          name = getWeaponType();
        }
        else if (d100 > 2 && d100 < 11) {
          name = getWeaponType();
          mod += 1;
          price += 2000;
        }
        else if (d100 > 10 && d100 < 30) {
          name = getWeaponType();
          mod += 2;
          price += 8000;
        }
        else if (d100 > 29 && d100 < 59) {
          name = getWeaponType();
          mod += 3;
          price += 18000;
        }
        else if (d100 > 58 && d100 < 63) {
          name = getWeaponType();
          mod += 4;
          price += 32000;
        }
        else if (d100 > 62 && d100 < 69) {
          //roll special weapon
          name = 'some special weapon';
          hasWeaponType = true;
        }
        else if (d100 > 68 && d100 < 101) {
          //re-roll then add special ability
          getWeaponStats();
          if (hasWeaponType) {
            if (isMelee) {
              addMeleeSpecialAbility();
            }
            else {
              addRangedSpecialAbility();
            }
          }
          else {
            print('Rolled special ability but no weapon type was found');
          }
        }
        break;
      case Rarity.VERY_RARE:
      case Rarity.LEGENDARY:
      //Major
      if (d100 < 3) {
        name = getWeaponType();
      }
      else if (d100 > 2 && d100 < 6) {
        name = getWeaponType();
        mod += 1;
        price += 2000;
      }
      else if (d100 > 5 && d100 < 16) {
        name = getWeaponType();
        mod += 2;
        price += 8000;
      }
      else if (d100 > 15 && d100 < 30) {
        name = getWeaponType();
        mod += 3;
        price += 18000;
      }
      else if (d100 > 29 && d100 < 40) {
        name = getWeaponType();
        mod += 4;
        price += 2000;
      }
      else if (d100 > 39 && d100 < 44) {
        name = getWeaponType();
        mod += 5;
        price += 2000;
      }
      else if (d100 > 43 && d100 < 64) {
        //roll special weapon
        name = 'some special weapon';
        hasWeaponType = true;
      }
      else if (d100 > 63 && d100 < 101) {
        //re-roll then add special ability
        getWeaponStats();
        if (hasWeaponType) {
          if (isMelee) {
            addMeleeSpecialAbility();
          }
          else {
            addRangedSpecialAbility();
          }
        }
        else {
          print('Rolled special ability but no weapon type was found');
        }
      }
        break;
    }
  }

  String getWeaponType() {
    hasWeaponType = true;
    int d100 = roll();
    String name;
    if (d100 < 71) {
      type = 0;
    }
    else if (d100 > 70 && d100 < 81) {
      type = 1;
    }
    else if (d100 > 80) {
      type = 2;
    }

    d100 = roll();

    switch (type) {
      //common melee
      case 0:
        if (d100 < 5) {
          name = 'dagger';
          price += 2;
        }
        else if (d100 > 4 && d100 < 15) {
          name = 'Greataxe';
          price += 30;
        }
        else if (d100 > 14 && d100 < 25) {
          name = 'Greatsword';
          price += 50;
        }
        else if (d100 > 24 && d100 < 29) {
          name = 'Kama';
          price += 2;
        }
        else if (d100 > 28 && d100 < 42) {
          name = 'Longsword';
          price += 15;
        }
        else if (d100 > 41 && d100 < 46) {
          name = 'Light Mace';
          price += 5;
        }
        else if (d100 > 45 && d100 < 51) {
          name = 'Heavy Mace';
          price += 12;
        }
        else if (d100 > 50 && d100 < 55) {
          name = 'Nunchaku';
          price += 2;
        }
        else if (d100 > 54 && d100 < 58) {
          name = 'Quarterstaff (Wood)';
          price += 50;
        }
        else if (d100 > 57 && d100 < 62) {
          name = 'Rapier';
          price += 20;
        }
        else if (d100 > 61 && d100 < 67) {
          name = 'Scimitar';
          price += 15;
        }
        else if (d100 > 66 && d100 < 71) {
          name = 'Shortspear';
          price += 2;
        }
        else if (d100 > 70 && d100 < 75) {
          name = 'Siangham';
          price += 3;
        }
        else if (d100 > 74 && d100 < 85) {
          name = 'Bastard Sword';
          price += 35;
        }
        else if (d100 > 84 && d100 < 90) {
          name = 'Short Sword';
          price += 10;
        }
        else if (d100 > 89 && d100 < 101) {
          name = 'Dwarven Waraxe';
          price += 30;
        }
        else {
          name = 'Error rolling for common weapon name roll: ${d100}';
        }
        break;

      //uncommon
      case 1:
        if (d100 < 4) {
          name = 'Orc Double War Axe';
          price += 360;
        }
        else if (d100 > 3 && d100 < 8) {
          name = 'Battleaxe';
          price += 10;
        }
        else if (d100 > 7 && d100 < 11) {
          name = 'Spiked Chain';
          price += 25;
        }
        else if (d100 > 10 && d100 < 13) {
          name = 'Club';
          price += 1;
        }
        else if (d100 > 12 && d100 < 17) {
          name = 'Hand Crossbow';
          price += 25;
          isMelee = false;
        }
        else if (d100 > 16 && d100 < 20) {
          name = 'Repeating Crossbow';
          price += 250;
          isMelee = false;
        }
        else if (d100 > 19 && d100 < 22) {
          name = 'Punching Dagger';
          price += 2;
        }
        else if (d100 > 21 && d100 < 24) {
          name = 'Falchion';
          price += 75;
        }
        else if (d100 > 23 && d100 < 27) {
          name = 'Dire Flail';
          price += 390;
        }
        else if (d100 > 26 && d100 < 32) {
          name = 'Heavy Flail';
          price += 15;
        }
        else if (d100 > 31 && d100 < 36) {
          name = 'Flail';
          price += 8;
        }
        else if (d100 > 35 && d100 < 38) {
          name = 'Gaunltet';
          price += 2;
        }
        else if (d100 > 37 && d100 < 40) {
          name = 'Spiked Gauntlet';
          price += 5;
        }
        else if (d100 > 39 && d100 < 42) {
          name = 'Glaive';
          price += 8;
        }
        else if (d100 > 41 && d100 < 44) {
          name = 'Greatclub';
          price += 5;
        }
        else if (d100 > 43 && d100 < 46) {
          name = 'Guisarme';
          price += 9;
        }
        else if (d100 > 45 && d100 < 49) {
          name = 'Halberd';
          price += 10;
        }
        else if (d100 > 48 && d100 < 52) {
          name = 'Spear';
          price += 1;
        }
        else if (d100 > 51 && d100 < 55) {
          name = 'Hooked Hammer';
          price += 320;
        }
        else if (d100 > 54 && d100 < 57) {
          name = 'Light Hammer';
          price += 1;
        }
        else if (d100 > 56 && d100 < 59) {
          name = 'Handaxe';
          price += 1;
        }
        else if (d100 > 58 && d100 < 62) {
          name = 'Kukri';
          price += 8;
        }
        else if (d100 > 61 && d100 < 65) {
          name = 'Lance';
          price += 10;
        }
        else if (d100 > 64 && d100 < 68) {
          name = 'Longspear';
          price += 5;
        }
        else if (d100 > 67 && d100 < 71) {
          name = 'Morningstar';
          price += 8;
        }
        else if (d100 > 70 && d100 < 73) {
          name = 'Net';
          price += 20;
          isMelee = false;
        }
        else if (d100 > 72 && d100 < 75) {
          name = 'Heavy Pick';
          price += 8;
        }
        else if (d100 > 74 && d100 < 77) {
          name = 'Light Pick';
          price += 4;
        }
        else if (d100 > 76 && d100 < 79) {
          name = 'Ranseur';
          price += 10;
        }
        else if (d100 > 78 && d100 < 81) {
          name = 'Sap';
          price += 1;
        }
        else if (d100 > 80 && d100 < 83) {
          name = 'Scythe';
          price += 18;
        }
        else if (d100 > 82 && d100 < 85) {
          name = 'Shuriken (50)';
          price += 10;
          isMelee = false;
        }
        else if (d100 > 84 && d100 < 87) {
          name = 'Sickle';
          price += 6;
        }
        else if (d100 > 86 && d100 < 90) {
          name = 'Two-Bladed Sword';
          price += 400;
        }
        else if (d100 > 89 && d100 < 92) {
          name = 'Trident';
          price += 15;
        }
        else if (d100 > 91 && d100 < 95) {
          name = 'Dwarven Urgrosh';
          price += 350;
        }
        else if (d100 > 94 && d100 < 98) {
          name = 'Warhammer';
          price += 12;
        }
        else if (d100 > 97 && d100 < 101) {
          name = 'Whip';
          price += 1;
        }
        else {
          name = 'Error rolling for common weapon name roll: ${d100}';
        }
        break;

        //ranged
      case 2:
        isMelee = false;
        if (d100 < 11) {
          name = 'Ammunition (50) Arrows/Bolts/Bullets';
          price += 2.5;
        }
        else if (d100 > 10 && d100 < 16) {
          name = 'Throwing Axe';
          price += 8;
        }
        else if (d100 > 15 && d100 < 26) {
          name = 'Heavy Crossbow';
          price += 50;
        }
        else if (d100 > 25 && d100 < 36) {
          name = 'Light Crossbow';
          price += 35;
        }
        else if (d100 > 35 && d100 < 40) {
          name = 'Dart';
          price += 0.5;
        }
        else if (d100 > 39 && d100 < 42) {
          name = 'Javelin';
          price += 1;
        }
        else if (d100 > 41 && d100 < 47) {
          name = 'Shortbow';
          price += 30;
        }
        else if (d100 > 46 && d100 < 52) {
          name = 'Shortbow, composite';
          price += 75;
        }
        else if (d100 > 51 && d100 < 57) {
          name = 'Shortbow, composite (STR damage bonus up to +1)';
          price += 150;
        }
        else if (d100 > 56 && d100 < 62) {
          name = 'Shortbow, composite (STR damage bonus up to +2)';
          price += 225;
        }
        else if (d100 > 61 && d100 < 66) {
          name = 'Sling';
          price += 1;
        }
        else if (d100 > 65 && d100 < 76) {
          name = 'Longbow';
          price += 75;
        }
        else if (d100 > 75 && d100 < 81) {
          name = 'Longbow, Composite';
          price += 100;
        }
        else if (d100 > 80 && d100 < 86) {
          name = 'Longbow, composite (STR damage bonus up to +1)';
          price += 200;
        }
        else if (d100 > 85 && d100 < 91) {
          name = 'Longbow, composite (STR damage bonus up to +2)';
          price += 300;
        }
        else if (d100 > 90 && d100 < 96) {
          name = 'Longbow, composite (STR damage bonus up to +3)';
          price += 400;
        }
        else if (d100 > 95 && d100 < 101) {
          name = 'Longbow, composite (STR damage bonus up to +4)';
          price += 500;
        }
        else {
          name = 'Error rolling for ranged weapon name roll: ${d100}';
        }
        break;
    }
    return name;
  }

  void addMeleeSpecialAbility() {
    int d100 = roll();
    switch (rarity) {
      case Rarity.VERY_COMMON:
      case Rarity.COMMON:
      price += 2000;
        //minor
        if (d100 < 11) {
          mod += 1;
          specialAbilities.writeln('<br>Bane: ' + abilities['Bane']);
        }
        else if (d100 > 10 && d100 < 18) {
          mod += 1;
          specialAbilities.writeln('<br>Defending: ' + abilities['Defending']);
        }
        else if (d100 > 17 && d100 < 28) {
          mod += 1;
          specialAbilities.writeln('<br>Flaming: ' + abilities['Flaming']);
        }
        else if (d100 > 27 && d100 < 38) {
          mod += 1;
          specialAbilities.writeln('<br>Frost: ' + abilities['Frost']);
        }
        else if (d100 > 37 && d100 < 48) {
          mod += 1;
          specialAbilities.writeln('<br>Shock: ' + abilities['Shock']);
        }
        else if (d100 > 47 && d100 < 57) {
          mod += 1;
          specialAbilities.writeln('<br>Ghost Touch: ' + abilities['Ghost Touch']);
        }
        else if (d100 > 56 && d100 < 68) {
          mod += 1;
          specialAbilities.writeln('<br>Bloodclaw: ' + abilities['Bloodclaw']);
        }
        else if (d100 > 67 && d100 < 72) {
          mod += 1;
          specialAbilities.writeln('<br>Ki Focus: ' + abilities['Ki Focus']);
        }
        else if (d100 > 71 && d100 < 76) {
          mod += 1;
          specialAbilities.writeln('<br>Merciful: ' + abilities['Merciful']);
        }
        else if (d100 > 75 && d100 < 83) {
          mod += 1;
          specialAbilities.writeln('<br>Mighty Cleaving: ' + abilities['Mighty Cleaving']);
        }
        else if (d100 > 82 && d100 < 88) {
          mod += 1;
          specialAbilities.writeln('<br>Spell Storing: ' + abilities['Spell Storing']);
        }
        else if (d100 > 87 && d100 < 92) {
          mod += 1;
          specialAbilities.writeln('<br>Throwing: ' + abilities['Throwing']);
        }
        else if (d100 > 91 && d100 < 96) {
          mod += 1;
          specialAbilities.writeln('<br>Thundering: ' + abilities['Thundering']);
        }
        else if (d100 > 95 && d100 < 100) {
          mod += 1;
          specialAbilities.writeln('<br>Vicious: ' + abilities['Vicious']);
        }
        else if (d100 == 100) {
          addMeleeSpecialAbility();
          addMeleeSpecialAbility();
        }
        break;
      case Rarity.UNCOMMON:
      case Rarity.RARE:
        //medium
      if (d100 < 7) {
        mod += 1;
        price += 2000;
        specialAbilities.writeln('<br>Bane: ' + abilities['Bane']);
      }
      else if (d100 > 6 && d100 < 13) {
        mod += 1;
        price += 2000;
        specialAbilities.writeln('<br>Defending: ' + abilities['Defending']);
      }
      else if (d100 > 12 && d100 < 20) {
        mod += 1;
        price += 2000;
        specialAbilities.writeln('<br>Flaming: ' + abilities['Flaming']);
      }
      else if (d100 > 19 && d100 < 27) {
        mod += 1;
        price += 2000;
        specialAbilities.writeln('<br>Frost: ' + abilities['Frost']);
      }
      else if (d100 > 26 && d100 < 34) {
        mod += 1;
        price += 2000;
        specialAbilities.writeln('<br>Shock: ' + abilities['Shock']);
      }
      else if (d100 > 33 && d100 < 39) {
        mod += 1;
        price += 2000;
        specialAbilities.writeln('<br>Ghost Touch: ' + abilities['Ghost Touch']);
      }
      else if (d100 > 38 && d100 < 45) {
        mod += 1;
        price += 2000;
        specialAbilities.writeln('<br>Bloodclaw: ' + abilities['Bloodclaw']);
      }
      else if (d100 > 44 && d100 < 49) {
        mod += 1;
        price += 2000;
        specialAbilities.writeln('<br>Ki Focus: ' + abilities['Ki Focus']);
      }
      else if (d100 > 48 && d100 < 51) {
        mod += 1;
        price += 2000;
        specialAbilities.writeln('<br>Merciful: ' + abilities['Merciful']);
      }
      else if (d100 > 50 && d100 < 55) {
        mod += 1;
        price += 2000;
        specialAbilities.writeln('<br>Mighty Cleaving: ' + abilities['Mighty Cleaving']);
      }
      else if (d100 > 54 && d100 < 60) {
        mod += 1;
        price += 2000;
        specialAbilities.writeln('<br>Spell Storing: ' + abilities['Spell Storing']);
      }
      else if (d100 > 59 && d100 < 64) {
        mod += 1;
        price += 2000;
        specialAbilities.writeln('<br>Throwing: ' + abilities['Throwing']);
      }
      else if (d100 > 63 && d100 < 66) {
        mod += 1;
        price += 2000;
        specialAbilities.writeln('<br>Thundering: ' + abilities['Thundering']);
      }
      else if (d100 > 65 && d100 < 70) {
        mod += 1;
        price += 2000;
        specialAbilities.writeln('<br>Vicious: ' + abilities['Vicious']);
      }
      else if (d100 > 69 && d100 < 73) {
        mod += 2;
        price += 8000;
        specialAbilities.writeln('<br>Anarchic: ' + abilities['Anarchic']);
      }
      else if (d100 > 72 && d100 < 76) {
        mod += 2;
        price += 8000;
        specialAbilities.writeln('<br>Axiomatic: ' + abilities['Axiomatic']);
      }
      else if (d100 > 75 && d100 < 79) {
        mod += 2;
        price += 8000;
        specialAbilities.writeln('<br>Disruption: ' + abilities['Disruption']);
      }
      else if (d100 > 78 && d100 < 82) {
        mod += 2;
        price += 8000;
        specialAbilities.writeln('<br>Flaming Burst: ' + abilities['Flaming Burst']);
      }
      else if (d100 > 81 && d100 < 85) {
        mod += 2;
        price += 8000;
        specialAbilities.writeln('<br>Icy Burst: ' + abilities['Icy Burst']);
      }
      else if (d100 > 84 && d100 < 88) {
        mod += 2;
        price += 8000;
        specialAbilities.writeln('<br>Holy: ' + abilities['Holy']);
      }
      else if (d100 > 87 && d100 < 91) {
        mod += 2;
        price += 8000;
        specialAbilities.writeln('<br>Shocking Burst: ' + abilities['Shocking Burst']);
      }
      else if (d100 > 90 && d100 < 94) {
        mod += 2;
        price += 8000;
        specialAbilities.writeln('<br>Unholy: ' + abilities['Unholy']);
      }
      else if (d100 > 93 && d100 < 96) {
        mod += 2;
        price += 8000;
        specialAbilities.writeln('<br>Wounding: ' + abilities['Wounding']);
      }
      else if (d100 > 95 && d100 < 101) {
        addMeleeSpecialAbility();
        addMeleeSpecialAbility();
      }
        break;
      case Rarity.VERY_RARE:
      case Rarity.LEGENDARY:
        //Major
      if (d100 < 4) {
        mod += 1;
        price += 2000;
        specialAbilities.writeln('<br>Bane: ' + abilities['Bane']);
      }
      else if (d100 > 3 && d100 < 7) {
        mod += 1;
        price += 2000;
        specialAbilities.writeln('<br>Flaming: ' + abilities['Flaming']);
      }
      else if (d100 > 6 && d100 < 10) {
        mod += 1;
        price += 2000;
        specialAbilities.writeln('<br>Frost: ' + abilities['Frost']);
      }
      else if (d100 > 9 && d100 < 13) {
        mod += 1;
        price += 2000;
        specialAbilities.writeln('<br>Shock: ' + abilities['Shock']);
      }
      else if (d100 > 12 && d100 < 16) {
        mod += 1;
        price += 2000;
        specialAbilities.writeln('<br>Ghost Touch: ' + abilities['Ghost Touch']);
      }
      else if (d100 > 15 && d100 < 18) {
        mod += 1;
        price += 2000;
        specialAbilities.writeln('<br>Ki Focus: ' + abilities['Ki Focus']);
      }
      else if (d100 > 17 && d100 < 20) {
        mod += 1;
        price += 2000;
        specialAbilities.writeln('<br>Bloodclaw: ' + abilities['Bloodclaw']);
      }
      else if (d100 > 19 && d100 < 22) {
        mod += 1;
        price += 2000;
        specialAbilities.writeln('<br>Mighty Cleaving: ' + abilities['Mighty Cleaving']);
      }
      else if (d100 > 21 && d100 < 25) {
        mod += 1;
        price += 2000;
        specialAbilities.writeln('<br>Spell Storing: ' + abilities['Spell Storing']);
      }
      else if (d100 > 24 && d100 < 29) {
        mod += 1;
        price += 2000;
        specialAbilities.writeln('<br>Throwing: ' + abilities['Throwing']);
      }
      else if (d100 > 28 && d100 < 33) {
        mod += 1;
        price += 2000;
        specialAbilities.writeln('<br>Thundering: ' + abilities['Thundering']);
      }
      else if (d100 > 32 && d100 < 37) {
        mod += 1;
        price += 2000;
        specialAbilities.writeln('<br>Vicious: ' + abilities['Vicious']);
      }
      else if (d100 > 36 && d100 < 42) {
        mod += 2;
        price += 8000;
        specialAbilities.writeln('<br>Anarchic: ' + abilities['Anarchic']);
      }
      else if (d100 > 41 && d100 < 47) {
        mod += 2;
        price += 8000;
        specialAbilities.writeln('<br>Axiomatic: ' + abilities['Axiomatic']);
      }
      else if (d100 > 46 && d100 < 50) {
        mod += 2;
        price += 8000;
        specialAbilities.writeln('<br>Disruption: ' + abilities['Disruption']);
      }
      else if (d100 > 49 && d100 < 55) {
        mod += 2;
        price += 8000;
        specialAbilities.writeln('<br>Flaming Burst: ' + abilities['Flaming Burst']);
      }
      else if (d100 > 54 && d100 < 60) {
        mod += 2;
        price += 8000;
        specialAbilities.writeln('<br>Icy Burst: ' + abilities['Icy Burst']);
      }
      else if (d100 > 59 && d100 < 65) {
        mod += 2;
        price += 8000;
        specialAbilities.writeln('<br>Holy: ' + abilities['Holy']);
      }
      else if (d100 > 65 && d100 < 70) {
        mod += 2;
        price += 8000;
        specialAbilities.writeln('<br>Shocking Burst: ' + abilities['Shocking Burst']);
      }
      else if (d100 > 69 && d100 < 75) {
        mod += 2;
        price += 8000;
        specialAbilities.writeln('<br>Unholy: ' + abilities['Unholy']);
      }
      else if (d100 > 74 && d100 < 79) {
        mod += 2;
        price += 8000;
        specialAbilities.writeln('<br>Wounding: ' + abilities['Wounding']);
      }
      else if (d100 > 78 && d100 < 84) {
        mod += 3;
        price += 18000;
        specialAbilities.writeln('<br>Speed: ' + abilities['Speed']);
      }
      else if (d100 > 83 && d100 < 87) {
        mod += 4;
        price += 32000;
        specialAbilities.writeln('<br>Brilliant Energy: ' + abilities['Brilliant Energy']);
      }
      else if (d100 > 86 && d100 < 89) {
        mod += 4;
        price += 32000;
        specialAbilities.writeln('<br>Dancing: ' + abilities['Dancing']);
      }
      else if (d100 > 88 && d100 < 91) {
        mod += 5;
        price += 50000;
        specialAbilities.writeln('<br>Vorpal: ' + abilities['Vorpal']);
      }
      else if (d100 > 90 && d100 < 101) {
        addMeleeSpecialAbility();
        addMeleeSpecialAbility();
      }
        break;
    }
  }

  void addRangedSpecialAbility() {
    int d100 = roll();
    switch (rarity) {
      case Rarity.VERY_COMMON:
      case Rarity.COMMON:
        //minor
        price += 2000;
        if (d100 < 12) {
          mod += 1;
          specialAbilities.writeln('<br>Bane: ' + abilities['Bane']);
        }
        else if (d100 > 12 && d100 < 26) {
          mod += 1;
          specialAbilities.writeln('<br>Distance: ' + abilities['Distance']);
        }
        else if (d100 > 25 && d100 < 41) {
          mod += 1;
          specialAbilities.writeln('<br>Flaming: ' + abilities['Flaming']);
        }
        else if (d100 > 40 && d100 < 56) {
          mod += 1;
          specialAbilities.writeln('<br>Frost: ' + abilities['Frost']);
        }
        else if (d100 > 55 && d100 < 61) {
          mod += 1;
          specialAbilities.writeln('<br>Merciful: ' + abilities['Merciful']);
        }
        else if (d100 > 60 && d100 < 69) {
          mod += 1;
          specialAbilities.writeln('<br>Returning: ' + abilities['Returning']);
        }
        else if (d100 > 68 && d100 < 84) {
          mod += 1;
          specialAbilities.writeln('<br>Shock: ' + abilities['Shock']);
        }
        else if (d100 > 83 && d100 < 94) {
          mod += 1;
          specialAbilities.writeln('<br>Seeking: ' + abilities['Seeking']);
        }
        else if (d100 > 93 && d100 < 100) {
          mod += 1;
          specialAbilities.writeln('<br>Thundering: ' + abilities['Thundering']);
        }
        else if (d100 > 99) {
          addRangedSpecialAbility();
          addRangedSpecialAbility();
        }
        break;
      case Rarity.UNCOMMON:
      case Rarity.RARE:
      //medium
      if (d100 < 9) {
        mod += 1;
        price += 2000;
        specialAbilities.writeln('<br>Bane: ' + abilities['Bane']);
      }
      else if (d100 > 8 && d100 < 17) {
        mod += 1;
        price += 2000;
        specialAbilities.writeln('<br>Distance: ' + abilities['Distance']);
      }
      else if (d100 > 16 && d100 < 29) {
        mod += 1;
        price += 2000;
        specialAbilities.writeln('<br>Flaming: ' + abilities['Flaming']);
      }
      else if (d100 > 28 && d100 < 41) {
        mod += 1;
        price += 2000;
        specialAbilities.writeln('<br>Frost: ' + abilities['Frost']);
      }
      else if (d100 > 40 && d100 < 43) {
        mod += 1;
        price += 2000;
        specialAbilities.writeln('<br>Merciful: ' + abilities['Merciful']);
      }
      else if (d100 > 42 && d100 < 48) {
        mod += 1;
        price += 2000;
        specialAbilities.writeln('<br>Returning: ' + abilities['Returning']);
      }
      else if (d100 > 47 && d100 < 60) {
        mod += 1;
        price += 2000;
        specialAbilities.writeln('<br>Shock: ' + abilities['Shock']);
      }
      else if (d100 > 59 && d100 < 65) {
        mod += 1;
        price += 2000;
        specialAbilities.writeln('<br>Seeking: ' + abilities['Seeking']);
      }
      else if (d100 > 64 && d100 < 69) {
        mod += 1;
        price += 2000;
        specialAbilities.writeln('<br>Thundering: ' + abilities['Thundering']);
      }
      else if (d100 > 68 && d100 < 72) {
        price += 8000;
        mod += 2;
        specialAbilities.writeln('<br>Anarchic: ' + abilities['Anarchic']);
      }
      else if (d100 > 71 && d100 < 75) {
        price += 8000;
        mod += 2;
        specialAbilities.writeln('<br>Axiomatic: ' + abilities['Axiomatic']);
      }
      else if (d100 > 74 && d100 < 80) {
        price += 8000;
        mod += 2;
        specialAbilities.writeln('<br>Flaming Burst: ' + abilities['Flaming Burst']);
      }
      else if (d100 > 79 && d100 < 83) {
        price += 8000;
        mod += 2;
        specialAbilities.writeln('<br>Holy: ' + abilities['Holy']);
      }
      else if (d100 > 82 && d100 < 88) {
        price += 8000;
        mod += 2;
        specialAbilities.writeln('<br>Icy Burst: ' + abilities['Icy Burst']);
      }
      else if (d100 > 87 && d100 < 93) {
        price += 8000;
        mod += 2;
        specialAbilities.writeln('<br>Shocking Burst: ' + abilities['Shocking Burst']);
      }
      else if (d100 > 92 && d100 < 96) {
        price += 8000;
        mod += 2;
        specialAbilities.writeln('<br>Unholy: ' + abilities['Unholy']);
      }
      else if (d100 > 95 && d100 < 101) {
        addRangedSpecialAbility();
        addRangedSpecialAbility();
      }
        break;
      case Rarity.VERY_RARE:
      case Rarity.LEGENDARY:
      //Major
      if (d100 < 5) {
        mod += 1;
        price += 2000;
        specialAbilities.writeln('<br>Bane: ' + abilities['Bane']);
      }
      else if (d100 > 4 && d100 < 9) {
        mod += 1;
        price += 2000;
        specialAbilities.writeln('<br>Distance: ' + abilities['Distance']);
      }
      else if (d100 > 10 && d100 < 13) {
        mod += 1;
        price += 2000;
        specialAbilities.writeln('<br>Flaming: ' + abilities['Flaming']);
      }
      else if (d100 > 12 && d100 < 17) {
        mod += 1;
        price += 2000;
        specialAbilities.writeln('<br>Frost: ' + abilities['Frost']);
      }
      else if (d100 > 16 && d100 < 22) {
        mod += 1;
        price += 2000;
        specialAbilities.writeln('<br>Returning: ' + abilities['Returning']);
      }
      else if (d100 > 21 && d100 < 26) {
        mod += 1;
        price += 2000;
        specialAbilities.writeln('<br>Shock: ' + abilities['Shock']);
      }
      else if (d100 > 25 && d100 < 28) {
        mod += 1;
        price += 2000;
        specialAbilities.writeln('<br>Seeking: ' + abilities['Seeking']);
      }
      else if (d100 > 27 && d100 < 30) {
        mod += 1;
        price += 2000;
        specialAbilities.writeln('<br>Thundering: ' + abilities['Thundering']);
      }
      else if (d100 > 29 && d100 < 35) {
        price += 8000;
        mod += 2;
        specialAbilities.writeln('<br>Anarchic: ' + abilities['Anarchic']);
      }
      else if (d100 > 34 && d100 < 40) {
        price += 8000;
        mod += 2;
        specialAbilities.writeln('<br>Axiomatic: ' + abilities['Axiomatic']);
      }
      else if (d100 > 39 && d100 < 50) {
        price += 8000;
        mod += 2;
        specialAbilities.writeln('<br>Flaming Burst: ' + abilities['Flaming Burst']);
      }
      else if (d100 > 49 && d100 < 55) {
        price += 8000;
        mod += 2;
        specialAbilities.writeln('<br>Holy: ' + abilities['Holy']);
      }
      else if (d100 > 54 && d100 < 65) {
        price += 8000;
        mod += 2;
        specialAbilities.writeln('<br>Icy Burst: ' + abilities['Icy Burst']);
      }
      else if (d100 > 65 && d100 < 75) {
        price += 8000;
        mod += 2;
        specialAbilities.writeln('<br>Shocking Burst: ' + abilities['Shocking Burst']);
      }
      else if (d100 > 74 && d100 < 80) {
        price += 8000;
        mod += 2;
        specialAbilities.writeln('<br>Unholy: ' + abilities['Unholy']);
      }
      else if (d100 > 79 && d100 < 85) {
        mod += 3;
        price += 18000;
        specialAbilities.writeln('<br>Speed: ' + abilities['Speed']);
      }
      else if (d100 > 84 && d100 < 91) {
        mod += 4;
        price += 32000;
        specialAbilities.writeln('<br>Unholy: ' + abilities['Unholy']);
      }
      else if (d100 > 90 && d100 < 101) {
        addRangedSpecialAbility();
        addRangedSpecialAbility();
      }
        break;
    }
  }
}