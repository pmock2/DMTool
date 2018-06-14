part of dm_tool;

class DiceRoll {
  String name, roll, color;

  DmProfile dmProfile;

  DiceRoll(this.name, this.roll, this.color);

  void addRollToProfile(DmProfile profile) {
    Map diceRoll = new Map();
    diceRoll = {
      name : {
        'name' : name,
        'roll' : roll,
        'color': color
      }
    };

    profile.addToGroup('dice_rolls', diceRoll);
  }
}

