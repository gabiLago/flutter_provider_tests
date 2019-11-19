import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_textfield_tests/screens/views/widgets/edit/instrument_item.dart';
import 'package:provider_textfield_tests/core/viewmodel/profile_viewmodel.dart';

class InstrumentsList extends StatefulWidget {
  InstrumentsList({Key key}) : super(key: key);

  @override
  _InstrumentsListState createState() => _InstrumentsListState();
}

class _InstrumentsListState extends State<InstrumentsList> {
  Set<String> _instrumentsSelected = Set<String>();

  void _handleInstrumentChanged(String instrument, bool isSelected) {
    setState(() {
      if (!isSelected) {
        _instrumentsSelected.add(instrument);
      } else {
        _instrumentsSelected.remove(instrument);
      }
      Provider.of<ProfileViewModel>(context, listen: false)
          .instrumentsToRemove(instrumentsSelected: _instrumentsSelected);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileViewModel>(
      builder: (context, data, child) {
        List<Widget> list = data.profile.instruments
                ?.map((instrument) => InstrumentItem(
                      instrument: instrument,
                      isSelected: _instrumentsSelected.contains(instrument),
                      onListChanged: _handleInstrumentChanged,
                    ))
                ?.toList() ??
            [];

        return Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: list,
        );
      },
    );
  }
}
