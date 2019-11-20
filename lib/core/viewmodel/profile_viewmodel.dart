
import 'package:flutter/material.dart';
import 'package:provider_textfield_tests/core/model/profile.dart';
import 'package:provider_textfield_tests/core/services/api.dart';
import 'package:provider_textfield_tests/core/viewmodel/state_viewmodel.dart';

class ProfileViewModel extends ChangeNotifier {
  Api _api = Api();

  Profile profile = Profile();
  StateViewModel viewState = StateViewModel();

  String test = 'Esto es un test';

  Set<String> instrumentsToRemoveList = {};

  Future getProfile() async {
    viewState.setState(ViewState.Busy);
    profile = await _api.getProfile();
    viewState.setState(ViewState.Idle);
    notifyListeners();
  } 

  getSyncProfile(){
    profile = _api.getProfileSync();
  }

  String getName(){
    return profile.name;
  }

  updateProfileLocation({friendlyLocation}) {
    viewState.setState(ViewState.Busy);
    profile.friendlyLocation = friendlyLocation;
    viewState.setState(ViewState.Idle);
    print('Location: ' + friendlyLocation);
    notifyListeners();
  }

  updateProfileName({name}) {
    viewState.setState(ViewState.Busy);
    profile.name = name;
    viewState.setState(ViewState.Idle);
    print('Name: ' + name);
    notifyListeners();
  }


  instrumentsToRemove({instrumentsSelected}) {
    viewState.setState(ViewState.Busy);
    instrumentsToRemoveList = instrumentsSelected;
    viewState.setState(ViewState.Idle);
    print(instrumentsToRemoveList);
    notifyListeners();
  }

  updateInstrumentsList() {
    viewState.setState(ViewState.Busy);
    instrumentsToRemoveList.map((String instrument) => profile.instruments.remove(instrument)).toList();
    viewState.setState(ViewState.Idle);
    print('Update');
    print(profile.instruments);
    notifyListeners();
  }

}
