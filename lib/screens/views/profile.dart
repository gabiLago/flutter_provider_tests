import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_textfield_tests/core/viewmodel/state_viewmodel.dart';
import 'package:provider_textfield_tests/screens/views/widgets/user/instrument_item.dart';
import 'package:provider_textfield_tests/screens/views/widgets/user/instruments_list.dart';
import 'package:provider_textfield_tests/core/viewmodel/profile_viewmodel.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (context) => ProfileViewModel()),
        ChangeNotifierProvider(builder: (context) => StateViewModel()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tests Text Fields'),
        ),
        body: Consumer<StateViewModel>(
          builder: (context, state, child) {
            return Center(
              child: Consumer<ProfileViewModel>(
                builder: (context, data, child) {
                  
                  // Cuando getProfile viene de una promesa hay que contemplar la posibilidad de que venga un null para hacer el map
                  //data.getSyncProfile();  
                  data.getProfile();
                  //List<Widget> syncList = data.profile.instruments.map((instrument) => InstrumentItem(instrument: instrument)).toList();
                  List<Widget> asyncList = data.profile.instruments?.map((instrument) => InstrumentItem(instrument: instrument))?.toList() ?? [];
                  
                  return state.state == ViewState.Idle
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Nombre: ${(data.profile).name}'),
                            Text('Ciudad: ${(data.profile).friendlyLocation}'),
                            //Text('Instruments: $instruments'),
                            Wrap(
                              spacing: 8.0,
                              runSpacing: 4.0,
                              //children: syncList
                              children: asyncList,
                            )
                            /*Wrap(
                              spacing: 8.0,
                              runSpacing: 4.0,
                              children: data.getInstruments(),
                            )*/
                          ],
                        )
                      : CircularProgressIndicator();
                },
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {Navigator.pushNamed(context, 'edit')},
          tooltip: 'Edit',
          child: Icon(Icons.edit),
        ),
      ),
    );
  }
}
