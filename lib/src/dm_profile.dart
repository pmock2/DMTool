part of dm_tool;

class DmProfile {
  Map profile;

  DmProfile(bool hasProfile, [Map newProfile]) {
    if (!hasProfile) {
      createUserProfile();
    }
  }


  void createUserProfile() {
    profile = {
      "dm_name" : "",
      "party_level" : "",
      "party" : {
        /*
        name : {
        'name' : name,
        'class' : className,
        'race' : race,
        'level' : level,
        'xp' : xp
      }
         */
      },
      "encounters" : {

      },
      "monsters" : {

      },
      "dice_rolls" : {

      },
      "notes" : {

      }
    };
  }

  void addToGroup(String key, var value) {
    if (!profile.containsValue(value)) {
      var objectKeyValue = profile[key];
      if (objectKeyValue is Map && value is Map) {
        objectKeyValue.addAll(value);
      }
    }
  }

}