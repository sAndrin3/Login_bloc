import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class loginScreen extends StatelessWidget {
  Widget build (context) {
    final bloc = Provider.of(context);

    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: [
          emailField(bloc),
          passwordField(bloc),
          Container(margin:EdgeInsets.only(top: 25.0)),
          submitButton(bloc),
        ],
      ),
    );
  }
  Widget emailField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
         return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'you@example.com',
            labelText: 'Email Address',
            errorText: snapshot.error?.toString(),
          ),
        );
      },
    );
   
  }
  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot ) {
        return TextField(
          onChanged: bloc.changePassword,
          obscureText: false,
          decoration: InputDecoration(
            hintText: 'password',
            labelText: 'password',
            errorText: snapshot.error?.toString(),
          ),
        );
      }
      
    );
    
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return ElevatedButton(
          child: Text('login'),
          style:  color(Colors.blue),
          onPressed: snapshot.hasData
              ? bloc.submit
              : null,
               
        );      
      },
    );


    
  }
  
  color(MaterialColor blue) {}
}