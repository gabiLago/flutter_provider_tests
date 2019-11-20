import 'package:flutter/widgets.dart';

enum ViewState { Idle, Busy }

class StateViewModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get getState => _state;

  void setState(ViewState state) {
    _state = state;
    print('State ViewModel:');
    print(_state);
    notifyListeners();
  }
}