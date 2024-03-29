import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_textfield_tests/core/viewmodel/state_viewmodel.dart';

import 'package:provider_textfield_tests/screens/route.dart';
import 'package:provider_textfield_tests/screens/views/base_view.dart';
import 'package:provider_textfield_tests/core/viewmodel/profile_viewmodel.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(builder: (context) => ProfileViewModel()),
      ChangeNotifierProvider(builder: (context) => StateViewModel()),
    ], child: MyApp()),
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
      initialRoute: 'intro',
      onGenerateRoute: Router.generateRoute,
    );
  }
}
