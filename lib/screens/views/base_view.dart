import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_textfield_tests/core/viewmodel/profile_viewmodel.dart';
import 'package:provider_textfield_tests/locator.dart';
//import 'package:provider_textfield_tests/core/viewmodel/base_viewmodel.dart';


/*
class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final Function(T) onModelReady;

  BaseView({this.builder, this.onModelReady});

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {


  @override
  void initState() {
    if (widget.onModelReady != null) {
//      widget.onModelReady(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
  //      builder: (context) => model,
        child: Consumer<T>(builder: widget.builder));
  }
}
*/
