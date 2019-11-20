
import 'package:flutter/material.dart';
import 'package:provider_textfield_tests/core/model/profile.dart';
import 'package:provider_textfield_tests/core/services/api.dart';
import 'package:provider_textfield_tests/core/viewmodel/state_viewmodel.dart';

class ProfileViewModel extends StateViewModel {
  Api _api = Api();

  Profile profile = Profile();
  StateViewModel viewState = StateViewModel();

  String test = 'Esto es un test';

  Set<String> instrumentsToRemoveList = {};

  Future getProfile() async {
    viewState.setState(ViewState.Busy);
    await Future.delayed(const Duration(seconds: 4), (){});
    profile = await _api.getProfile();
    viewState.setState(ViewState.Idle);
    notifyListeners();
  } 


  
  updateProfileLocation({friendlyLocation}) {
    profile.friendlyLocation = friendlyLocation;
    
    print('Location: ' + friendlyLocation);
    notifyListeners();
  }

  updateProfileName({name}) {
    profile.name = name;
    
    print('Name: ' + name);
    notifyListeners();
  }


  instrumentsToRemove({instrumentsSelected}) {
    instrumentsToRemoveList = instrumentsSelected;
    
    print(instrumentsToRemoveList);
    notifyListeners();
  }

  updateInstrumentsList() {
    instrumentsToRemoveList.map((String instrument) => profile.instruments.remove(instrument)).toList();
    
    print('Update');
    print(profile.instruments);
    notifyListeners();
  }

}
