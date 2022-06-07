// // import 'dart:async';
// // import 'validators.dart';
// // import 'package:rxdart/rxdart.dart';
// //
// // class Bloc with Validators {
// //   final BehaviorSubject _emailController = BehaviorSubject<String>();
// //   final BehaviorSubject _passwordController = BehaviorSubject<String>();
// //   final BehaviorSubject Observable = BehaviorSubject<bool>();
// //
// //   Function(String) get changeEmail => _emailController.sink.add;
// //   Function(String) get changePassword => _passwordController.sink.add;
// //
// //   Stream<String> get email => _emailController.stream.transform(validateEmail);
// //   Stream<String> get password => _passwordController.stream.transform(validatePassword);
// //   BehaviorSubject get submitValid => Observable;
// //
// //   void submit() {
// //     final validEmail = _emailController.value;
// //     final validPassword = _passwordController.value;
// //
// //     print('Email is $validEmail');
// //     print('Password is $validPassword');
// //   }
// //
// //   void dispose() {
// //     _emailController.close();
// //     _passwordController.close();
// //   }
// // }
//
// enum FieldName {
//   FirstName,
//   LastName,
//   Email,
//   Password,
//   ConfirmPassword,
// }

import 'package:flutter/material.dart';
import 'package:fluttertask/week12/bloc/provi.dart';

import 'login.dart';

class HomePage extends StatelessWidget {
  changeThePage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => PageTwo()));
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Bloc();

    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc Pattern"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StreamBuilder<String>(
                stream: bloc.email,
                builder: (context, snapshot) => TextField(
                  onChanged: bloc.emailChanged,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter email",
                    labelText: "Email",
                    // errorText: snapshot.error
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              StreamBuilder<String>(
                stream: bloc.password,
                builder: (context, snapshot) => TextField(
                  onChanged: bloc.passwordChanged,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter password",
                    labelText: "Password",
                    // errorText: snapshot.error
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              StreamBuilder(
                stream: bloc.submitValid,
                builder: (context, snapshot) => ElevatedButton(
                  onPressed: () {
                    snapshot.hasData ? ()=> changeThePage(context) : null;
                  },
                  child: Text(""),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
