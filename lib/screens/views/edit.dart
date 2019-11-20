import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_textfield_tests/screens/views/widgets/edit/instruments_list.dart';
import 'package:provider_textfield_tests/core/viewmodel/profile_viewmodel.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfile createState() => _EditProfile();
}

class _EditProfile extends State<EditProfile> {
  final TextEditingController _nameController = TextEditingController();
  String name;
  final TextEditingController _locationController = TextEditingController();
  String location;

  void _save() {
    print('_save');
    Provider.of<ProfileViewModel>(context, listen: false).updateInstrumentsList();
    Navigator.pushNamed(context, 'profile');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<ProfileViewModel>(
        builder: (context, data, child) {
          data.getProfile();
          return Scaffold(
            appBar: AppBar(
              title: Text('Tests Text Fields'),
            ),
            body: Column(
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
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => _save(),
              tooltip: 'Save',
              child: Icon(Icons.save),
            ),
          );
        },
      ),
    );
  }
}
