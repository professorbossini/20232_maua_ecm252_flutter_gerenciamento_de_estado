import 'package:flutter/material.dart';

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
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'seu@email.com',
        labelText: 'Digite seu e-mail'
      ),
    );
  }

  Widget passwordField(){
    //devolver um textfield
    return TextField(
      obscureText: true,
      // keyboardType: TextInputType.visiblePassword,
      // keyboardAppearance: Brightness.dark,
      decoration: InputDecoration(
        hintText: 'Senha',
        labelText: 'Digite sua senha'
      ),
    );
  }

  Widget submitButton(){
    return ElevatedButton(
      onPressed: (){}, 
      child: Text('Login')
    );
  }

}