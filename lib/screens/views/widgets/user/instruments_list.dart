import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_textfield_tests/screens/views/widgets/user/instrument_item.dart';
import 'package:provider_textfield_tests/core/viewmodel/profile_viewmodel.dart';

class InstrumentsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileViewModel>(
      builder: (context, data, child) {
        List<String> instruments = data.profile.instruments;
        return Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: instruments
              .map(
                  (String instrument) => InstrumentItem(instrument: instrument))
              .toList(),
        );
      },
    );
  }
}
