import 'package:flutter/material.dart';
import 'package:provider_textfield_tests/screens/views/base_view.dart';

class Intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenidos'),
      ),
      body: Center(
        child: IconButton(
          onPressed: () => Navigator.pushNamed(context, 'profile'),
          icon: Icon(Icons.save_alt),
        ),
      ),
    );
  }
}
