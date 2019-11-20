import 'package:flutter/material.dart';
import 'package:provider_textfield_tests/core/viewmodel/profile_viewmodel.dart';
import 'package:provider_textfield_tests/core/viewmodel/state_viewmodel.dart';

enum ProfileMode { edit, user }

class ProfileModeViewModel extends ProfileViewModel {
  ProfileMode _profileMode = ProfileMode.user;

  ProfileMode get state => _profileMode;

  void setMode(ProfileMode profileMode) {
    _profileMode = profileMode;
    print(_profileMode);
    notifyListeners();
  }
}
