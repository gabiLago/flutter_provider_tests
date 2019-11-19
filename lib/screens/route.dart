import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider_textfield_tests/screens/intro.dart';
import 'package:provider_textfield_tests/screens/views/edit.dart';
import 'package:provider_textfield_tests/screens/views/profile.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'edit':
        return MaterialPageRoute(builder: (context) => EditProfile());
      case 'profile':
        return MaterialPageRoute(builder: (context) => ProfileView());
      case 'intro':
        return MaterialPageRoute(builder: (context) => Intro());
        
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
