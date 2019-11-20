import 'package:flutter/material.dart';

enum ProfileMode { edit, user }

class ProfileModeViewModel extends ChangeNotifier {
  ProfileMode _profileMode = ProfileMode.user;

  ProfileMode get state => _profileMode;

  void setState(ProfileMode profileMode) {
    _profileMode = profileMode;
    print(_profileMode);
    notifyListeners();
  }
}
