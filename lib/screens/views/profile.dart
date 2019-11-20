import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_textfield_tests/core/viewmodel/profile_mode_viewmodel.dart';
import 'package:provider_textfield_tests/core/viewmodel/state_viewmodel.dart';
import 'package:provider_textfield_tests/screens/views/widgets/edit/instruments_list.dart';
import 'package:provider_textfield_tests/screens/views/widgets/user/instrument_item.dart';
import 'package:provider_textfield_tests/core/viewmodel/profile_viewmodel.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  initState() {
    super.initState();
    Provider.of<ProfileViewModel>(context, listen: false).getProfile();
  }

  void _switchMode(profileMode) {
    if (profileMode == ProfileMode.edit) _save();
    profileMode == ProfileMode.user
        ? profileMode = ProfileMode.edit
        : profileMode = ProfileMode.user;
    setState(() {
      Provider.of<ProfileModeViewModel>(context).setState(profileMode);
    });
  }

  void _save() {
    print('_save');
    Provider.of<ProfileViewModel>(context).updateInstrumentsList();

    Navigator.pushNamed(context, 'profile');
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileModeViewModel>(
      builder: (context, profileMode, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Tests Text Fields'),
          ),
          body: Center(
            child: Consumer<ProfileViewModel>(
              builder: (context, state, child) {
                print(state.getState);
                return state.getState == ViewState.Idle
                    ? profileMode.state == ProfileMode.user
                        ? UserProfile()
                        : EditProfile()
                    : CircularProgressIndicator();
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _switchMode(profileMode.state),
            tooltip: 'Edit',
            child: Icon(profileMode.state == ProfileMode.user
                ? Icons.edit
                : Icons.save),
          ),
        );
      },
    );
  }
}

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileViewModel>(builder: (context, data, child) {
      List<Widget> asyncList = data.profile.instruments
              ?.map((instrument) => InstrumentItem(instrument: instrument))
              ?.toList() ??
          [];
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Nombre: ${(data.profile).name}'),
          Text('Ciudad: ${(data.profile).friendlyLocation}'),
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: asyncList,
          )
        ],
      );
    });
  }
}

class EditProfile extends StatefulWidget {
  @override
  _EditProfile createState() => _EditProfile();
}

class _EditProfile extends State<EditProfile> {
  final TextEditingController _nameController = TextEditingController();
  String name;
  final TextEditingController _locationController = TextEditingController();
  String location;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<ProfileViewModel>(
        builder: (context, data, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                  decoration: InputDecoration(hintText: data.profile.name),
                  autocorrect: false,
                  controller: _nameController,
                  onChanged: (String value) =>
                      data.updateProfileName(name: value)),
              TextField(
                decoration:
                    InputDecoration(hintText: data.profile.friendlyLocation),
                autocorrect: false,
                controller: _locationController,
                onChanged: (String value) {
                  data.updateProfileLocation(friendlyLocation: value);
                },
              ),
              InstrumentsList(),
            ],
          );
        },
      ),
    );
  }
}
