import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_textfield_tests/core/viewmodel/state_viewmodel.dart';
import 'package:provider_textfield_tests/screens/views/widgets/edit/instruments_list.dart';
import 'package:provider_textfield_tests/core/viewmodel/profile_viewmodel.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfile createState() => _EditProfile();
}

class _EditProfile extends State<EditProfile> {
  String name;
  String location;

  void _save() {
    FocusScope.of(context).requestFocus(FocusNode());
    Navigator.pushNamed(context, 'profile');
    Provider.of<ProfileViewModel>(context, listen: false)
        .updateProfileName(name: name);
    Provider.of<ProfileViewModel>(context, listen: false)
        .updateProfileLocation(friendlyLocation: location);
    Provider.of<ProfileViewModel>(context, listen: false)
        .updateInstrumentsList();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (context) => ProfileViewModel()),
        ChangeNotifierProvider(builder: (context) => StateViewModel()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tests Text Fields'),
        ),
        body: Consumer<StateViewModel>(
          builder: (context, state, child) {
            return Center(
              child: Consumer<ProfileViewModel>(
                builder: (context, data, child) {
                  
                  data.getProfile();
                  name = data.profile.name;
                  location = data.profile.friendlyLocation;

                  return Column(
                    children: <Widget>[
                      TextField(
                          decoration: InputDecoration.collapsed(
                            hintText: name,
                          ),
                          onChanged: (text) => name = text),
                      TextField(
                          decoration: InputDecoration.collapsed(
                            hintText: location,
                          ),
                          onChanged: (text) => location = text),
                      InstrumentsList(),
                    ],
                  );
                },
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _save,
          tooltip: 'Save',
          child: Icon(Icons.save),
        ),
      ),
    );
  }
}
