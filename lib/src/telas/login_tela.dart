import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
class LoginTela extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(28.0),
      child: Column(
        children: [
          emailField(),
          passwordField(),
          Container(
            margin: EdgeInsets.only(top: 12.0),
            child: Row(
              children: [
                Expanded(
                  child: submitButton()
                )
              ],
            ),
          )
            
        ],
      )
    );

  }
  Widget emailField(){
    return StreamBuilder(
      stream: bloc.email,
      builder:(context, AsyncSnapshot<String> snapshot){
        return TextField(
          onChanged: (newValue){
            bloc.changeEmail(newValue);
          },
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'seu@email.com',
            labelText: 'Digite seu e-mail',
            errorText: snapshot.hasError ? snapshot.error.toString() : null
          ),
        );
      }  
    );
    // return TextField(
    //   keyboardType: TextInputType.emailAddress,
    //   decoration: InputDecoration(
    //     hintText: 'seu@email.com',
    //     labelText: 'Digite seu e-mail'
    //   ),
    // );
  }

  Widget passwordField(){
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, AsyncSnapshot<String> snapshot){
        return TextField(
          onChanged: bloc.changePassword,
          obscureText: true,
          // keyboardType: TextInputType.visiblePassword,
          // keyboardAppearance: Brightness.dark,
          decoration: InputDecoration(
            hintText: 'Senha',
            labelText: 'Digite sua senha',
            errorText: snapshot.error?.toString()
            // errorText: snapshot.hasError ? '${snapshot.error}' : null
          ),
        );
      },
    );
    //devolver um textfield
  }

  Widget submitButton(){
    return ElevatedButton(
      onPressed: (){}, 
      child: Text('Login')
    );
  }

}