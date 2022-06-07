// //
// // import 'package:flutter/material.dart';
// // import 'package:fluttertask/week12/bloc/provi.dart';
// //
// // import 'bloc.dart';
// //
// //
// // class Login extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     final bloc = Provider.of(context);
// //
// //     return Scaffold(
// //         appBar: AppBar(
// //           title: Text('Login'),
// //         ),
// //         body: Container(
// //           margin: EdgeInsets.all(20.0),
// //           child: Column(
// //             children: [
// //               emailField(bloc),
// //               passwordField(bloc),
// //               Container(margin: EdgeInsets.only(top: 25.0)),
// //               submitButton(bloc)
// //             ],
// //           ),
// //         )
// //     );
// //   }
// //
// //   Widget emailField(Bloc bloc) => StreamBuilder<String>(
// //     stream: bloc.email,
// //     builder: (context, snap) {
// //       return TextField(
// //         keyboardType: TextInputType.emailAddress,
// //         onChanged: bloc.changeEmail,
// //         decoration: InputDecoration(
// //             labelText: 'Email address',
// //             hintText: 'you@example.com',
// //             // errorText: snap.error
// //         ),
// //       );
// //     },
// //   );
// //
// //   Widget passwordField(Bloc bloc) => StreamBuilder<String>(
// //       stream: bloc.password,
// //       builder:(context, snap) {
// //         return TextField(
// //           obscureText: true,
// //           onChanged: bloc.changePassword,
// //           decoration: InputDecoration(
// //               labelText: 'Password',
// //               hintText: 'Password',
// //               // errorText: snap.error
// //           ),
// //         );
// //       }
// //   );
// //
// //   Widget submitButton(Bloc bloc) => StreamBuilder<bool>(
// //     builder: (context, snap) {
// //       return RaisedButton(
// //         onPressed: (!snap.hasData) ? null : bloc.submit,
// //         child: Text('Login', style: TextStyle(color: Colors.white),),
// //         color: Colors.blue,
// //       );
// //     },
// //   );
// // }
//
//
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:fluttertask/week12/bloc/validators.dart';
//
// import 'bloc.dart';
//
// class RegisterForm extends StatefulWidget {
//   @override
//   _RegisterFormState createState() => _RegisterFormState();
// }
//
// class _RegisterFormState extends State<RegisterForm> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _passwordController = TextEditingController();
//
//   final Map<FieldName, String> _mappingFieldName = {
//     FieldName.FirstName: 'firstName',
//     FieldName.LastName: 'lastName',
//     FieldName.Email: 'email',
//     FieldName.Password: 'password',
//     FieldName.ConfirmPassword: 'confirmPassword',
//   };
//
//   Map<String, String> _formData = {
//     'firstName': '',
//     'lastName': '',
//     'email': '',
//     'password': '',
//     'confirmPassword': '',
//   };
//
//   String firstNameError = '';
//   String lastNameError = '';
//   String emailError = '';
//   String passwordError = '';
//   String confirmPasswordError = '';
//
//   @override
//   void dispose() {
//     _passwordController.dispose();
//     super.dispose();
//   }
//
//   void _submitForm() {
//     if (!_formKey.currentState!.validate()) return;
//     _formKey.currentState!.save();
//     showDialog(
//       context: context,
//       builder: (BuildContext ctx) => AlertDialog(
//         title: Text('Register Successfully!'),
//         content: Text('Form data: ${json.encode(_formData)}'),
//         actions: [
//           TextButton(
//               onPressed: () {
//                 setState(() {
//                   _formData = {
//                     'firstName': '',
//                     'lastName': '',
//                     'email': '',
//                     'password': '',
//                     'confirmPassword': '',
//                   };
//                 });
//                 _formKey.currentState!.reset();
//                 _passwordController.text = '';
//                 FocusScope.of(context).requestFocus(FocusNode());
//                 Navigator.of(context).pop();
//               },
//               child: Text('Close'))
//         ],
//       ),
//     );
//   }
//
//   void _setFieldError(FieldName fieldName, String error) {
//     switch (fieldName) {
//       case FieldName.FirstName:
//         setState(() {
//           firstNameError = error;
//         });
//         break;
//       case FieldName.LastName:
//         setState(() {
//           lastNameError = error;
//         });
//         break;
//       case FieldName.Email:
//         setState(() {
//           emailError = error;
//         });
//         break;
//       case FieldName.Password:
//         setState(() {
//           passwordError = error;
//         });
//         break;
//       case FieldName.ConfirmPassword:
//         setState(() {
//           confirmPasswordError = error;
//         });
//         break;
//     }
//   }
//
//   void _onFieldSaved(String fieldName, String value) {
//     setState(() {
//       _formData[fieldName] = value;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         padding: const EdgeInsets.all(20),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: <Widget>[
//               CustomErrorFormField(
//                 label: 'First Name',
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     final String error = 'First Name is required';
//                     _setFieldError(FieldName.FirstName, error);
//                     return error;
//                   }
//                   _setFieldError(FieldName.FirstName, '');
//                   return null;
//                 },
//                 error: firstNameError,
//                 onSaved: (value) => _onFieldSaved(
//                     _mappingFieldName[FieldName.FirstName] as String,
//                     value as String),
//               ),
//               CustomErrorFormField(
//                 label: 'Last Name',
//                 validator: (value) {
//                   if (value?.isEmpty == true) {
//                     final String error = 'Last Name is required';
//                     _setFieldError(FieldName.LastName, error);
//                     return error;
//                   }
//                   _setFieldError(FieldName.LastName, '');
//                   return null;
//                 },
//                 error: lastNameError,
//                 onSaved: (value) => _onFieldSaved(
//                     _mappingFieldName[FieldName.LastName] as String,
//                     value as String),
//               ),
//               CustomErrorFormField(
//                 label: 'Email Address',
//                 validator: (value) {
//                   var error = 'Please enter a registered email';
//                   if (value!.isEmpty) {
//                     _setFieldError(FieldName.Email, error);
//                     return error;
//                   }
//                   if (!value.contains('@')) {
//                     error = 'Enter a valid email';
//                     _setFieldError(FieldName.Email, error);
//                     return error;
//                   }
//                   _setFieldError(FieldName.Email, '');
//                   return null;
//                 },
//                 error: emailError,
//                 onSaved: (value) => _onFieldSaved(
//                     _mappingFieldName[FieldName.Email] as String,
//                     value as String),
//               ),
//               CustomErrorFormField(
//                 label: 'Password',
//                 validator: (value) {
//                   var error = 'Please enter a password';
//                   if (value!.isEmpty) {
//                     _setFieldError(FieldName.Password, error);
//                     return error;
//                   }
//
//                   if (value.length < 6) {
//                     error = 'Password must have at least 6 characters';
//                     _setFieldError(FieldName.Password, error);
//                   }
//
//                   _setFieldError(FieldName.Password, '');
//                   return null;
//                 },
//                 error: passwordError,
//                 controller: _passwordController,
//                 onSaved: (value) => _onFieldSaved(
//                     _mappingFieldName[FieldName.Password] as String,
//                     value as String),
//                 type: FieldName.Password,
//               ),
//               CustomErrorFormField(
//                 label: 'Confirm Password',
//                 validator: (value) {
//                   var error = 'Please confirm password';
//
//                   if (value!.isEmpty) {
//                     _setFieldError(FieldName.ConfirmPassword, error);
//                     return error;
//                   }
//
//                   if (value != _passwordController.text) {
//                     error = 'Password & Confirm Password does not match';
//                     _setFieldError(FieldName.ConfirmPassword, error);
//                     return error;
//                   }
//                   _setFieldError(FieldName.ConfirmPassword, '');
//                   return null;
//                 },
//                 error: confirmPasswordError,
//                 isLastField: true,
//                 onSaved: (value) => _onFieldSaved(
//                     _mappingFieldName[FieldName.ConfirmPassword] as String,
//                     value as String),
//                 type: FieldName.Password,
//               ),
//               Container(
//                 margin: const EdgeInsets.only(
//                   top: 20,
//                 ),
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   style: ButtonStyle(
//                     padding: MaterialStateProperty.all<EdgeInsets>(
//                       const EdgeInsets.all(15),
//                     ),
//                     elevation: MaterialStateProperty.all<double>(0.0),
//                     backgroundColor: MaterialStateProperty.all<Color>(
//                       const Color(0xff2980b9),
//                     ),
//                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                       RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                     ),
//                   ),
//                   onPressed: _submitForm,
//                   child: Text(
//                     'Submit'.toUpperCase(),
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'dart:async';
import 'package:fluttertask/week12/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validators implements BaseBloc {
  // final _emailController = BehaviorSubject<String>();
  // final _passwordController = BehaviorSubject<String>();
  //
  // Function(String) get emailChanged => _emailController.sink.add;
  // Function(String) get passwordChanged => _passwordController.sink.add;
  //
  // //Another way
  // // StreamSink<String> get emailChanged => _emailController.sink;
  // // StreamSink<String> get passwordChanged => _passwordController.sink;
  //
  // Stream<String> get email => _emailController.stream.transform(emailValidator);
  // Stream<String> get password =>
  //     _passwordController.stream.transform(passwordValidator);
  //
  // Stream<bool> get submitCheck =>
  //       Observable.combineLatest2(email, password, (e, p) => true);

  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  Stream<String> get email => _emailController.stream.transform(emailValidator);
  Stream<String> get password => _passwordController.stream.transform(passwordValidator);
  Stream<bool> get submitValid => CombineLatestStream.combine2(email, password, (email, password) => true);

  Function(String) get emailChanged => _emailController.sink.add;
  Function(String) get passwordChanged => _passwordController.sink.add;

  // Stream<bool> get submitCheck =>
  //       Observable.combineLatest2(email, password, (e, p) => true);

  submit() {
    final validEmail    = _emailController.sink;
    final validPassword = _passwordController.sink;

    print('$validEmail and $validPassword');
  }

  @override
  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
}

abstract class BaseBloc {
  void dispose();
}
