// // // import 'dart:async';
// // //
// // // class Validators {
// // //   final validateEmail = StreamTransformer<String, String>.fromHandlers(
// // //       handleData: (String email, EventSink<String> sink) {
// // //         if (email.contains('@')) {
// // //           sink.add(email);
// // //         } else {
// // //           sink.addError('Enter a valid email');
// // //         }
// // //       }
// // //   );
// // //
// // //   final validatePassword = StreamTransformer<String, String>.fromHandlers(
// // //       handleData: (String password, EventSink<String> sink) {
// // //         if (password.length > 3) {
// // //           sink.add(password);
// // //         } else {
// // //           sink.addError('Enter must be at least 4 characters');
// // //         }
// // //       }
// // //   );
// // // }
// //
// //
// // import 'package:flutter/material.dart';
// //
// // import 'bloc.dart';
// //
// // class CustomErrorFormField extends StatelessWidget {
// //   final String label;
// //   final bool? isLastField;
// //   final String? Function(String?)? validator;
// //   final String error;
// //   final TextEditingController? controller;
// //   final Function(String?)? onSaved;
// //   final FieldName? type;
// //
// //   CustomErrorFormField({
// //     required this.label,
// //     required this.validator,
// //     required this.error,
// //     required this.onSaved,
// //     this.isLastField,
// //     this.controller,
// //     this.type,
// //   });
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Text(
// //           label,
// //           style: TextStyle(
// //             color: Color(0xff7d7e79),
// //             fontSize: 16,
// //           ),
// //         ),
// //         SizedBox(height: 8),
// //         Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Container(
// //               margin: const EdgeInsets.only(bottom: 8),
// //               child: TextFormField(
// //                 controller: controller,
// //                 obscureText: type == FieldName.Password ? true : false,
// //                 validator: validator,
// //                 onSaved: onSaved,
// //                 textInputAction: isLastField == true
// //                     ? TextInputAction.done
// //                     : TextInputAction.next,
// //                 decoration: InputDecoration(
// //                   floatingLabelBehavior: FloatingLabelBehavior.never,
// //                   contentPadding: const EdgeInsets.symmetric(
// //                     horizontal: 15,
// //                   ),
// //                   errorStyle: TextStyle(
// //                     color: Colors.transparent,
// //                     fontSize: 0,
// //                     height: 0,
// //                   ),
// //                   border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(5),
// //                     borderSide: const BorderSide(
// //                       color: Color(0xffe3e3e3),
// //                       width: 2.0,
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //             AnimatedPadding(
// //               padding: EdgeInsets.only(
// //                 bottom: error.isEmpty ? 0.0 : 10.0,
// //               ),
// //               duration: Duration(milliseconds: 180),
// //               child: error.isNotEmpty
// //                   ? Text(
// //                 error,
// //                 textAlign: TextAlign.start,
// //                 style: TextStyle(
// //                   color: Colors.red,
// //                   fontSize: 12,
// //                 ),
// //               )
// //                   : null,
// //             )
// //           ],
// //         ),
// //       ],
// //     );
// //   }
// // }
//
// import 'dart:async';
//
// mixin Validators {
//   var emailValidator =
//       StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
//     if (email.contains("@")) {
//       sink.add(email);
//     } else {
//       sink.addError("Email is not valid");
//     }
//   });
//
//   var passwordValidator = StreamTransformer<String, String>.fromHandlers(
//       handleData: (password, sink) {
//     if (password.length > 4) {
//       sink.add(password);
//     } else {
//       sink.addError("Password length should be greater than 4 chars.");
//     }
//   });
// }
