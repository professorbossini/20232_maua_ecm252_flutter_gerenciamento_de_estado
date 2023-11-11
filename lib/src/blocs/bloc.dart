import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
class Bloc with Validators{
  final _emailController = BehaviorSubject <String>();
  final _passwordController = BehaviorSubject <String>();

  Stream <String> get email => _emailController.stream.transform(validateEmail);
  Stream <String> get password { return _passwordController.stream.transform(validatePassword);}

  Stream <bool> get emailAndPasswordAreOk => CombineLatestStream.combine2(
    email, password, (e, p) => true
  );

  void submitForm(BuildContext context){
    final email = _emailController.value;
    final password = _passwordController.value;
    //print('$email, $password');
    CherryToast.success(
      title: Text('$email, $password'),
    ).show(context);
  }

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  void dispose(){
    _emailController.close();
    _passwordController.close();
  }
  
}
// final bloc = Bloc();


