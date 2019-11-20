import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_textfield_tests/core/viewmodel/profile_mode_viewmodel.dart';
import 'package:provider_textfield_tests/core/viewmodel/state_viewmodel.dart';
import 'package:provider_textfield_tests/core/viewmodel/profile_viewmodel.dart';
import 'package:provider_textfield_tests/screens/route.dart';


void main() {
  runApp(
    ChangeNotifierProvider(builder: (context) => ProfileModeViewModel(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      initialRoute: 'profile',
      onGenerateRoute: Router.generateRoute,
    );
  }
}
