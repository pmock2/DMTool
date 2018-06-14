part of dm_tool;

class PartyMember {

  String name, className, race;
  int level;
  int xp;

  PartyMember(this.name, this.className, this.race, this.level, this.xp);

  void changePlayerValue(String toChange, var value, DmProfile profile) {
    switch(toChange) {
      case "name":
        if (value is String) {
          name = value;
        }
        break;
      case "class":
        if (value is String) {
          className = value;
        }
        break;
      case "race":
        if (value is String) {
          race = value;
        }
        break;
      case "level":
        if (value is int) {
          level = value;
        }
        break;
      case "xp":
        if (value is int) {
          xp = value;
        }
        break;
    }

  }

  void addPlayerToProfile(DmProfile profile) {
    Map partyMember = new Map();
    partyMember = {
      name : {
        'name' : name,
        'class' : className,
        'race' : race,
        'level' : level.toString(),
        'xp' : xp.toString(),
        'notes' : ''
      }
    };
    profile.addToGroup('party', partyMember);
  }

  void  updatePlayerInProfile() {

  }

}