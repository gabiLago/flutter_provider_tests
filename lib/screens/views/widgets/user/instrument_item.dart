import 'package:flutter/material.dart';

typedef void InstrumentsListCallback(String instrument, bool isSelected);

class InstrumentItem extends StatelessWidget {
  final String instrument;

  InstrumentItem({String instrument})
      : instrument = instrument,
        super(key: ObjectKey(instrument));

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _pill(instrument, context),
      ],
    );
  }

  Container _pill(String name, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 3.0, top: 3.0),
      decoration: _getPillBoxDecoration(context),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 5.0, 12.0, 5.0),
        child: Text(
          name,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  BoxDecoration _getPillBoxDecoration(BuildContext context) {
    var _boxColor = Colors.indigo.shade200;

    return BoxDecoration(
      borderRadius: BorderRadius.all(const Radius.circular(15.0)),
      color: _boxColor,
    );
  }
}
