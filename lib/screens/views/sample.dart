/*import 'dart:async';
import 'package:flutter/material.dart';
import '../models/user.dart';

class EditProfileView extends StatefulWidget {
  @override
  _EditProfileViewState createState() => new _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  void _handleSubmitted() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      _autovalidate = true; // Start validating on every change.
      showInSnackBar('Please fix the errors in red before submitting.');
    } else {
      showInSnackBar('snackchat');
      User.instance.first_name = firstName;
      User.instance.last_name = lastName;

      User.instance.save().then((result) {
        print("Saving done: ${result}.");
      });
    }
  }

  // controllers for form text controllers
  final TextEditingController _firstNameController = new TextEditingController();
  String firstName = User.instance.first_name;
  final TextEditingController _lastNameController = new TextEditingController();
  String lastName = User.instance.last_name;

  @override
  void initState() {
    _firstNameController.text = firstName;
    _lastNameController.text = lastName;
    return super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final DateTime today = new DateTime.now();

    return new Scaffold(
        appBar: new AppBar(title: const Text('Edit Profile'), actions: <Widget>[
          new Container(
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 5.0, 10.0),
              child: new MaterialButton(
                color: themeData.primaryColor,
                textColor: themeData.secondaryHeaderColor,
                child: new Text('Save'),
                onPressed: () {
                  _handleSubmitted();
                  Navigator.pop(context);
                },
              ))
        ]),
        body: new Form(
            key: _formKey,
            autovalidate: _autovalidate,
            onWillPop: _warnUserAboutInvalidData,
            child: new ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: <Widget>[
                new Container(
                  child: new TextField(
                    decoration: const InputDecoration(labelText: "First Name", hintText: "What do people call you?"),
                    autocorrect: false,
                    controller: _firstNameController,
                    onChanged: (String value) {
                      firstName = value;
                    },
                  ),
                ),
                new Container(
                  child: new TextField(
                    decoration: const InputDecoration(labelText: "Last Name"),
                    autocorrect: false,
                    controller: _lastNameController,
                    onChanged: (String value) {
                      lastName = value;
                    },
                  ),
                ),
              ],
            )));
  }
}*/