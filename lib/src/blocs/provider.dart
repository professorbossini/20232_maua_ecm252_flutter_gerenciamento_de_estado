import 'package:flutter/material.dart';
import 'bloc.dart';

class Provider extends InheritedWidget{

  Provider({Key? key, required Widget child}): super(key: key, child: child);

  final bloc = Bloc();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static Bloc of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<Provider>()!.bloc;
  }
}