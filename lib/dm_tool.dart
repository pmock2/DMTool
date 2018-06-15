library dm_tool;

import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'dart:math';


part 'src/dm_profile.dart';
part 'src/party_member.dart';
part 'src/dice_roll.dart';
part 'src/loot.dart';

class DmTool {
  DivElement container;
  DmProfile dmProfile;
  List<StreamSubscription> listeners = new List<StreamSubscription>();
  DivElement homeButton;

  void init() {
    container = document.getElementById('container')
    ..id = "main_container";
    createInitialMenu();
  }

  void createInitialMenu() {
    String mainMenuMarkup =
        '''
        <div class="container_section">
        <div class="main_title">Welcome to the DM Tool</div>
        <button class="main_menu_button" id="existing_profile_button">Existing Profile</button>
        <button class="main_menu_button" id="new_profile_button">Create New Profile</button>
        </div>
        ''';
    container.setInnerHtml((mainMenuMarkup));

    listeners.add(container.querySelector('#new_profile_button').onClick.listen((e) {
      createNewDmMenu();
    })
    );

    listeners.add(getElement('#existing_profile_button').onClick.listen((e) {
      loadDmMenu();
    }));

  }

  void readFile(InputElement input) {
    if (input.files.isNotEmpty) {
      File file = input.files[0];
      FileReader fr = new FileReader();
      fr.readAsText(file);
      listeners.add(fr.onLoad.listen((e) {
        dmProfile = new DmProfile(false);
        Map profile = JSON.decode(fr.result.toString());
        dmProfile.profile = profile;
        createHomeButton();
        goToMainMenu();
      })
      );
    }
  }

  void loadDmMenu() {
    String menu =
        '''
        <div class="main_title menu_title">Upload Profile</div>
        <div id="upload_dm_section" class="container_section">
          <div class="title">Upload Profile</div>
          <input class="main_input" id="dm_file" type="file" accept=".json" placeholder="file">
          <button id="import">Import</button>
        </div>
        ''';
    container.setInnerHtml(menu);
    InputElement input = getElement('#dm_file');

    listeners.add(getElement('#import').onClick.listen((e) {
      readFile(input);
    }));
  }

  void createNewDmMenu() {
    String menu =
        '''
        <div class="main_title menu_title">New DM</div>
        <div id="new_dm_section" class="container_section">
          <div class="title">DM Name:</div>
          <input class="main_input" id="dm_name" type="text" placeholder="Name">
          <div class="title">Party Level:</div>
          <input min="0" max="20" class="main_input" id="current_party_level" type="number" placeholder="0">
          <button id="submit_new_dm">Submit</button>
          <div class="menu_title" id="error_message"></div>
        </div>
        ''';

    container.setInnerHtml(menu);

    listeners.add(container.querySelector('#submit_new_dm').onClick.listen((e) {
      num level;
      try {
        level = num.parse((container.querySelector("#current_party_level") as InputElement).value);
      }
      on Exception catch (_) {
        getElement('#error_message').innerHtml = "Please enter a valid party level";
      }
      if (level != null && !level.isNegative) {
        dmProfile = new DmProfile(false);
        dmProfile.profile['dm_name'] = (container.querySelector("#dm_name") as InputElement).value;
        dmProfile.profile['party_level'] = (container.querySelector("#current_party_level") as InputElement).value;
        dmProfile.profile['party_level'] = dmProfile.profile['party_level'] == '' ? '0' : dmProfile.profile['party_level'];

        createHomeButton();
        goToMainMenu();
      }
      else {
        getElement('#error_message').innerHtml = "Please enter a valid party level";
      }
    })
    );
  }

  void createHomeButton() {
    homeButton = new DivElement()
      ..innerHtml = "Home"
      ..id = "home_button"
      ..style.fontSize = '28px'
      ..style.position = 'fixed';
    document.body.append(homeButton);

    homeButton.onClick.listen((e) {
      goToMainMenu();
    });

  }

  void goToMainMenu() {
    String menu =
        '''
        <div id="home_menu_container" class="container_section">
          <div class="main_title menu_title" id="home_screen_title">${dmProfile.profile['dm_name']}'s Home Menu</div>
          <div class="home_menu_item" id="dice_roller">
            <div class="home_menu_item_text">Dice Roller</div>
          </div>
          <div class="home_menu_item" id="party_info">
            <div class="home_menu_item_text">Party Info</div>
          </div>
          <div class="home_menu_item" id="loot">
            <div class="home_menu_item_text">Loot Gen</div>
          </div>
          <div class="home_menu_item" id="encounters">
            <div class="home_menu_item_text">Encounters</div>
          </div>
          <button id="save_and_exit">Save</button>
        </div>
        ''';
    listeners.forEach((item) {
      item.cancel();
    });

    listeners.clear();
    container.setInnerHtml(menu);
    homeButton.style.display = 'none';
    
    listeners.add(getElement('#save_and_exit').onClick.listen((e) {
      var json = JSON.encode(dmProfile.profile);
      String test = json.toString();
      downloadFileToClient("dmprofile.json", test);
    })
    );

    listeners.add(getElement('#party_info').onClick.listen((e) {
      goToPartyInfo();
    })
    );

    listeners.add(getElement('#dice_roller').onClick.listen((e) {
      goToDiceRoller();
    })
    );

    listeners.add(getElement('#loot').onClick.listen((e) {
      goToLootGen();
    })
    );

  }

  void goToLootGen() {

  }

  void goToDiceRoller() {
    String menu =
    '''
        <div id="dice_roller_menu" class="container_section">
          <div class="main_title menu_title" id="dice_roller_screen_title">Dice Roller</div>
          <div>Insert your roll using standard notation. Example: 2d8+8</div>
          <input class="main_input" type="text" placeholder="roll" id="dice_roll">
          <button class="dice_roll_button" id="roll">Roll</button>
          <button class="dice_roll_button" id="save_roll">Save Roll</button>
          <div id="roll_content">
            <div id="roll_result"></div>
            <div id="roll_message">Please enter a valid roll</div>
          </div>
          <div id="saved_rolls_container">

          </div>
        </div>
        ''';

    container.setInnerHtml(menu);
    homeButton.style.display = 'block';

    populateCustomRolls();

    getElement('#roll').onClick.listen((e) {
      getDiceRoll();
    });

    getElement('#save_roll').onClick.listen((e) {{
      InputElement rollText = getElement('#dice_roll');
      if (rollText.value != '') {
        openNewDiceRollPopup(rollText.value);
      }
    }});
  }

  void openNewDiceRollPopup(String roll) {
    String addDiceRollMenu =
    '''
        <div id="new_dice_roll_menu" class="popup_box ">
          <div class="popup_box_title">New Dice Roll</div>
          <div class="info_item popup_box_item"> Name: 
            <input class="popup_input_item"  type="text" id="name"> 
          </div>
          <div class="info_item popup_box_item">Roll:
            <input class="popup_input_item"  type="text" id="entered_roll" value="$roll"> 
          </div>
          <div class="info_item popup_box_item">Color:
            <input class="popup_input_item" type="color" id="color">
          </div>
          <button id="submit_new_dice_roll" class="popup_box_submit_button">Submit</button>
          <button id="cancel_dice_roll" class="popup_box_cancel_button">Cancel</button>
        </div>
        ''';
    DivElement popupMenu = new DivElement();
    popupMenu.setInnerHtml(addDiceRollMenu);
    getElement('.container_section').style.filter = 'blur(5px)';
    container.append(popupMenu);

    getElement('#submit_new_dice_roll').onClick.listen((e) {
      String name = (getElement('#name') as InputElement).value;
      String roll = (getElement('#entered_roll') as InputElement).value;
      String color = (getElement('#color') as InputElement).value;
      print(color);

      if (roll.isNotEmpty && name.isNotEmpty && color.isNotEmpty) {
        DiceRoll diceRoll = new DiceRoll(name, roll, color);
        diceRoll.addRollToProfile(dmProfile);
        removePopUp('new_dice_roll_menu');
        populateCustomRolls();
      }
    });

    getElement('#cancel_dice_roll').onClick.listen((e) {
      removePopUp('new_dice_roll_menu');
      populateCustomRolls();
    });
  }

  void populateCustomRolls() {
    Element container = getElement('#saved_rolls_container');
    container.children.clear();

    (dmProfile.profile['dice_rolls'] as Map).forEach((rollName, value) {
      if (value is Map) {
        ButtonElement button = new ButtonElement();
        button.innerHtml = rollName;
        button.style.background = value['color'];
        button.classes.add('custom_roll_button');

        button.onClick.listen((e) {
          getDiceRoll(value['roll']);
        });

        container.append(button);
      }
    });
  }

  void getDiceRoll([String savedRoll]) {
    String roll;
    if (savedRoll == null) {
      roll = (getElement('#dice_roll') as InputElement).value;
    }
    else {
      roll = savedRoll;
    }
    Element message =  getElement('#roll_message');
    Element resultMessage = getElement('#roll_result');
    bool badState = false;
    int total = 0;
    roll = roll.trim();
    roll = roll.replaceAll(" ", "");
    bool getNext = false;
    int i = 0;
    int min = 1;
    StringBuffer buildString = new StringBuffer();
    StringBuffer rollsString = new StringBuffer();
    String ref = '';
    int currentMod = 1;

    bool isNumber(String val) {
      bool isNum = false;
      switch (val) {
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
        case '0':
          isNum = true;
          break;
      }
      return isNum;
    }

    List chars = roll.split('');

    chars.forEach((char) {
      String nextChar;
      if ((i + 1) < chars.length) {
        nextChar = chars[i + 1];
      }
      //if not in bad state
      if (!badState) {
        //if we need to record this number
        if (getNext) {
          //if the next numbers are a dice roll
          if (ref == 'd') {
            buildString.write(char);

            //if next number is a symbol, we have the entire roll.
            if (!isNumber(nextChar)) {
              getNext = false;
              int dice = int.parse(buildString.toString());
              int max = dice + 1;

              //roll dice with mod, add to total and reset values
              for (int i = 0; i < currentMod; i++) {
                Random r = new Random();
                int newRoll = min + r.nextInt(max - min);
                rollsString.write(' + $newRoll');
                print(' + $newRoll');
                total += newRoll;
              }

              buildString.clear();
              currentMod = 1;
              ref = '';
            }
          }

          //if the reference point is a + sign
          else if (ref == '+') {
            //as long as the next char is a number or dice roll
            if (isNumber(nextChar) || nextChar == 'd' || nextChar == null || nextChar == '-' || nextChar == '+') {
              if (isNumber(char)) {
                buildString.write(char);
              }

              //if the next number is a dice roll
              if (nextChar == 'd') {
                currentMod = int.parse(buildString.toString());
                getNext = false;
                ref = '';
                buildString.clear();
              }
              // if its anything besides a 'd' and another number, its a static value and safe to add to the total
              else if (!isNumber(nextChar)) {
                rollsString.write(' + ${buildString.toString()}');
                print(' + ${buildString.toString()}');
                total += int.parse(buildString.toString());

                getNext = false;
                ref = '';
                buildString.clear();
              }
            } else {
              badState = true;
            }
          }

          //if ref is '-'
          else if (ref == '-') {
            //as long as the next char is a number or dice roll
            if (isNumber(nextChar) || nextChar == 'd' || nextChar == null || nextChar == '-' || nextChar == '+') {
              if (isNumber(char)) {
                buildString.write(char);
              }

              //if the next number is a dice roll
              if (nextChar == 'd') {
                badState = true;
                getNext = false;
                ref = '';
                buildString.clear();
              }
              // if its anything besides a 'd' and another number, its a static value and safe to add to the total
              else if (!isNumber(nextChar)) {
                rollsString.write(' - ${buildString.toString()}');
                print(' - ${buildString.toString()}');
                total -= int.parse(buildString.toString());

                getNext = false;
                ref = '';
                buildString.clear();
              }
            } else {
              badState = true;
            }
          }
          else if (ref == 'num') {
            buildString.write(char);
            if (nextChar == 'd') {
              currentMod = int.parse(buildString.toString());
              ref = '';
              getNext = false;
              buildString.clear();
            }
            else if (nextChar == '-' || nextChar == '+' || nextChar == null){
              rollsString.write(' + ${buildString.toString()}');
              print(' + ${buildString.toString()}');
              total += int.parse(buildString.toString());
              ref = '';
              buildString.clear();
              getNext = false;
            }
            else if (!isNumber(nextChar)) {
              badState = true;
            }
          }
        }
        //if we're getting new input
        else if (char == 'd') {
          if (isNumber(nextChar)) {
            getNext = true;
            ref = 'd';
          } else {
            badState = true;
          }
        }
        else if (char == '+') {
          ref = '+';

          //if the next char is a number
          if (isNumber(nextChar)) {
            getNext = true;
          } else if (nextChar != 'd') {
            badState = true;
          }
        }
        else if (char == '-') {
          ref = '-';
          if (isNumber(nextChar)) {
            getNext = true;
          } else if (nextChar != 'd') {
            badState = true;
          }
        }
        else if(isNumber(char)) {
          if (isNumber(nextChar)) {
            buildString.write(char);
            getNext = true;
            ref = 'num';
          }
          else if (nextChar != null && nextChar == 'd') {
            currentMod = int.parse(char);
          }
          else if (nextChar != null && (nextChar == '-' || nextChar == '+')) {
            print(' + ${char}');
            total += int.parse(char);
          }
          else {
            badState = true;
          }
        }
        else {
          badState = true;
        }
        i++;
      }
    });

    if (badState) {
      message.style.display = 'block';
      resultMessage.style.display = 'none';
      message.text = 'Please Enter a Valid Value';
    }
    else {
      message.style.display = 'block';
      message.text = rollsString.toString().trim().replaceRange(0, 1, '');
      resultMessage.style.display = 'block';
      resultMessage.text = total.toString();
    }

  }

  void goToPartyInfo() {
    String menu =
        '''
        <div id="party_info_menu" class="container_section">
        <div class="main_title menu_title" id="party_info_screen_title">Party Info</div>
          <div class="info_item">Party Level: 
            <input type="number" readonly class="editable_info_value" id="party_level_from_profile" value="">
          </div>
          <button id="new_player">Add Party Member</button>
          <div class="info_item">Party Members: </div>
          <div id="players_container">
          //insert players here
          </div>
        </div>
        ''';

    container.setInnerHtml(menu);
    homeButton.style.display = 'block';

    (getElement('#party_level_from_profile') as InputElement).value = dmProfile.profile['party_level'];
    AddPartyMembersToList();

    listeners.add(getElement('#party_level_from_profile').onClick.listen((Event e) {
      (e.target as InputElement).readOnly = false;
      (e.target as InputElement).select();
      window.onClick.listen((f) {
        if (f.target != e.target && getElement("#party_level_from_profile") != null) {
          (e.target as InputElement).readOnly = true;
          dmProfile.profile['party_level'] = (getElement("#party_level_from_profile") as InputElement).value;
          dmProfile.profile['party_level'] = dmProfile.profile['party_level'] == '' ? '0' : dmProfile.profile['party_level'];
        }
      });

      window.onKeyDown.listen((KeyboardEvent k) {
        if (k.key == 'Enter') {
          (e.target as InputElement).readOnly = true;
          dmProfile.profile['party_level'] = (getElement("#party_level_from_profile") as InputElement).value;
          dmProfile.profile['party_level'] = dmProfile.profile['party_level'] == '' ? '0' : dmProfile.profile['party_level'];
        }
      });
    }));

    listeners.add(getElement("#new_player").onClick.listen((e) {
      addNewPlayerPopup();
    }));
  }

  void addNewPlayerPopup() {
    String addPlayerMenu =
        '''
        <div id="new_player_menu" class="popup_box ">
          <div class="popup_box_title">Create Party Member</div>
          <div class="info_item popup_box_item"> Name: 
            <input class="popup_input_item"  type="text" id="name"> 
          </div>
          <div class="info_item popup_box_item">Class:
            <input class="popup_input_item"  type="text" id="class"> 
          </div>
          <div class="info_item popup_box_item"> Race: 
            <input class="popup_input_item"  type="text" id="race"> 
          </div>
          <div class="info_item popup_box_item"> Level: 
            <input class="popup_input_item"  type="number" id="level"> 
          </div>
          <div class="info_item popup_box_item"> XP: 
            <input class="popup_input_item" type="number" id="xp"> 
          </div>
          <button id="submit_new_party_member" class="popup_box_submit_button">Submit</button>
          <button id="cancel_create_player" class="popup_box_cancel_button">Cancel</button>
        </div>
        '''
        ;
    DivElement popupMenu = new DivElement();
    popupMenu.setInnerHtml(addPlayerMenu);
    getElement('.container_section').style.filter = 'blur(5px)';
    container.append(popupMenu);

    listeners.add(getElement('#submit_new_party_member').onClick.listen((e) {
      String name = (getElement('#name') as InputElement).value;
      String className = (getElement('#class') as InputElement).value;
      String race = (getElement('#race') as InputElement).value;

      int level;
      if ((getElement('#level') as InputElement).value != '') {
        level = int.parse((getElement('#level') as InputElement).value);
      }

      int xp;
      if ((getElement('#level') as InputElement).value != '') {
        xp = int.parse((getElement('#xp') as InputElement).value);
      }

      if (name.isNotEmpty && className.isNotEmpty && race.isNotEmpty && xp != null && level != null) {
        PartyMember member = new PartyMember(name, className, race, level, xp);
        member.addPlayerToProfile(dmProfile);
        removePopUp('new_player_menu');
        AddPartyMembersToList();
      }
    })
    );

    listeners.add(getElement('#cancel_create_player').onClick.listen((e) {
      removePopUp('new_player_menu');
    })
    );
  }

  void AddPartyMembersToList() {
    Element members = getElement('#players_container');
    members.children.clear();
    (dmProfile.profile['party'] as Map).keys.forEach((member) {
      Map partyMember = dmProfile.profile['party'][member];
      DivElement memberDiv = new DivElement();
      String memberMarkup =
          '''
          <div class="party_member_container" id="${partyMember['name']}_container">
          <div class="party_member_title">${partyMember['name']}</div>
            <div class="party_member_item">Name:
              <input readonly type="text" value="${partyMember['name']}" class="editable_info_value party_item_value">
            </div>
            <div class="party_member_item">Race:
              <input readonly type="text" value="${partyMember['race']}" class="editable_info_value party_item_value">
            </div>
            <div class="party_member_item">Class:
              <input readonly type="text" value="${partyMember['class']}" class="editable_info_value party_item_value">
            </div>
            <div class="party_member_item">Level:
              <input id="${partyMember['name']}_level" readonly type="number" value="${partyMember['level']}" class="editable_info_value party_item_value">
            </div>
            <div class="party_member_item">XP:
              <input id="${partyMember['name']}_xp" readonly type="number" value="${partyMember['xp']}" class="editable_info_value party_item_value">
            </div>
          </div>
          ''';
      memberDiv.setInnerHtml(memberMarkup);
      members.children.add(memberDiv);

      listeners.add(getElement('#${partyMember['name']}_level').onClick.listen((Event e) {
        InputElement xpElement = (e.target as InputElement);
        xpElement.readOnly = false;
        xpElement.select();
        window.onClick.listen((f) {
          if (f.target != e.target) {
            xpElement.readOnly = true;
            num number;
            try {
              number = num.parse(xpElement.value);
              if (number != null && !number.isNegative) {
                dmProfile.profile['party'][member]['level'] = xpElement.value;
                dmProfile.profile['party'][member]['level'] = dmProfile.profile['party'][member]['level'] == '' ? '0' : dmProfile.profile['party'][member]['level'];
              }
              else {
                xpElement.value = dmProfile.profile['party'][member]['level'].toString();
              }
            }
            on Exception catch (_) {
              xpElement.value = dmProfile.profile['party'][member]['level'];
            }
          }
        });

        window.onKeyDown.listen((KeyboardEvent k) {
          if (k.key == 'Enter') {
            xpElement.readOnly = true;
            num number;
            try {
              number = num.parse(xpElement.value);
              if (number != null && !number.isNegative) {
                dmProfile.profile['party'][member]['level'] = xpElement.value;
                dmProfile.profile['party'][member]['level'] = dmProfile.profile['party'][member]['level'] == '' ? '0' : dmProfile.profile['party'][member]['level'];
              }
              else {
                xpElement.value = dmProfile.profile['party'][member]['level'];
              }
            }
            on Exception catch (_) {
              xpElement.value = dmProfile.profile['party'][member]['level'];
            }
          }
        });
      }));

      listeners.add(getElement('#${partyMember['name']}_xp').onClick.listen((Event e) {
        InputElement xpElement = (e.target as InputElement);
        xpElement.readOnly = false;
        xpElement.select();
        window.onClick.listen((f) {
          if (f.target != e.target) {
            xpElement.readOnly = true;
            num number;
            try {
              number = num.parse(xpElement.value);
              if (number != null && !number.isNegative) {
                dmProfile.profile['party'][member]['xp'] = xpElement.value;
                dmProfile.profile['party'][member]['xp'] = dmProfile.profile['party'][member]['xp'] == '' ? '0' : dmProfile.profile['party'][member]['xp'];
              }
              else {
                xpElement.value = dmProfile.profile['party'][member]['xp'].toString();
              }
            }
            on Exception catch (_) {
              xpElement.value = dmProfile.profile['party'][member]['xp'];
            }
          }
        });

        window.onKeyDown.listen((KeyboardEvent k) {
          if (k.key == 'Enter') {
            xpElement.readOnly = true;
            num number;
            try {
              number = num.parse(xpElement.value);
              if (number != null && !number.isNegative) {
                dmProfile.profile['party'][member]['xp'] = xpElement.value;
                dmProfile.profile['party'][member]['xp'] = dmProfile.profile['party'][member]['xp'] == '' ? '0' : dmProfile.profile['party'][member]['xp'];
              }
              else {
                xpElement.value = dmProfile.profile['party'][member]['xp'];
              }
            }
            on Exception catch (_) {
              xpElement.value = dmProfile.profile['party'][member]['xp'];
            }
          }
        });
      }));

    });
  }

  void removePopUp(String id) {
    getElement('#$id').remove();
    getElement('.container_section').style.filter = 'unset';
  }

  void downloadFileToClient(String filename, String text){
    try {
      AnchorElement tl = document.createElement('a');
      tl
        ..attributes['href'] = 'data:text/plain;charset=utf-8,' + Uri.encodeComponent(text)
        ..attributes['download'] = filename;

      var clickEvent = new MouseEvent('click');
      tl.dispatchEvent(clickEvent);
    }
    on Exception catch (e){
      print('The creation of the file [${filename}] has failed : ${e.toString()}.');
    }
  }


  Element getElement(String querySelector) {
    Element element = container.querySelector(querySelector);
    if (element != null) {
      return element;
    }
    else {
      return null;
    }
  }

}