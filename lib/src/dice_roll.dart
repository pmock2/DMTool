part of dm_tool;

class DiceRoll {
  String name, roll;

  DiceRoll(this.name, this.roll);

  void addRollToProfile(var profile) {
    if (profile is Map) {
      var diceRolls = profile['dice_rolls'];
      if (diceRolls is Map) {
        diceRolls[name] = roll;
      }
    }
  }
}

