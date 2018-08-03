part of dm_tool;

class Encounter {
  Map<int, String> participants = new Map();
  Element container;

  StreamController _onCloseEncounter = new StreamController.broadcast();
  Stream get onCloseEncounter => _onCloseEncounter.stream;
  Future _closeOnCloseEncounter () => _onCloseEncounter.close();

  List<StreamSubscription> listeners = new List();

  Element homeButton;

  Encounter(this.container, this.homeButton) {
    setUI();
  }

  void setUI() {
    String content = '''
    <div>
    <div class="main_title menu_title" id="encounter_screen_title">Encounter</div>
      <div class="encounter_adder">
        <input class="main_input" placeholder="name" id="participant_name">
        <input class="main_input" placeholder="Init." id="initiative" type="number">
        <button id="add">Add</button>
      </div>
      <button id="begin">Begin</button>
      <div id="players_container">
      </div>
    </div>
    ''';
    container.setInnerHtml(content);
    homeButton.style.display = 'block';

    InputElement name = container.querySelector('#name');
    InputElement init = container.querySelector('#init');

    void addParticipantToList(String name, int initiative) {
      
    }

    listeners.add(
      container.querySelector('#add').onClick.listen((e) {
        if (name.value != null && name.value.isNotEmpty && init.value != null && init.value.isNotEmpty) {
          //add the participant to the list
        }
      })
    );

    listeners.add(
      container.querySelector('#begin').onClick.listen((e) {
        //begin the encounter
      })
    );
  }

  void close() {
    listeners.forEach((listener) {
      listener.cancel;
    });

    listeners.clear();

    container.innerHtml = '';

    _onCloseEncounter.add(true);
  }
}
