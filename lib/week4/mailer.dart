// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:http/http.dart' as http;
// import 'package:mailer/mailer.dart';
// import 'package:mailer/smtp_server.dart';
//
// class SendService extends StatefulWidget {
//   const SendService({Key? key}) : super(key: key);
//
//   @override
//   State<SendService> createState() => _SendServiceState();
// }
//
// class _SendServiceState extends State<SendService> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("intent demo"),
//         backgroundColor: Colors.black87,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//
//
//             ElevatedButton(
//                 onPressed: () {
//                   // launch(
//                   //     'mailto:aksiddhpura410@gmail.com?subject= mail from aakash&body=hii i am aakash');
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => SendEmail()));
//                 },
//                 child: Text("direct send email")),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class SendEmail extends StatefulWidget {
//   const SendEmail({Key? key}) : super(key: key);
//
//   @override
//   State<SendEmail> createState() => _SendEmailState();
// }
//
// class _SendEmailState extends State<SendEmail> {
//   final _formkey = GlobalKey<FormState>();
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _subjectController = TextEditingController();
//   TextEditingController _msgController = TextEditingController();
//
//   bool _isLoading = false;
//
//   Future sendEmail() async {
//     setState(() {
//       _isLoading = true;
//     });
//     final user = await GoogleAuthApi.signIn();
//
//     if (user == null) return;
//     final email = user.email;
//     final auth = await user.authentication;
//     final token = auth.accessToken!;
//
//     GoogleAuthApi.signout();
//
//     final smtpServer = gmailSaslXoauth2(email, token);
//
//     final message = Message()
//       ..from = Address(email, 'Mayur Parmar')
//       ..recipients = [_emailController.text]
//       ..subject = _subjectController.text
//       ..text = _msgController.text;
//
//     try {
//       await send(message, smtpServer);
//
//       Fluttertoast.showToast(msg: 'succesful');
//       _emailController.clear();
//       _subjectController.clear();
//       _nameController.clear();
//       _msgController.clear();
//     } on MailerException catch (e) {
//       print(e);
//     }
//
//     setState(() {
//       _isLoading = false;
//     });
//   }
//
//   late final FocusNode myfocusnode;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     GoogleAuthApi.signout();
//     super.initState();
//     myfocusnode = FocusNode();
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     myfocusnode.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Send email"),
//         backgroundColor: Colors.black87,
//       ),
//       body: ModalProgressHUD(
//         inAsyncCall: _isLoading,
//         child: SingleChildScrollView(
//           child: Center(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Form(
//                 key: _formkey,
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(18.0),
//                       child: TextFormField(
//                         focusNode: myfocusnode,
//                         controller: _nameController,
//                         decoration: InputDecoration(
//                             border: OutlineInputBorder(), labelText: "name"),
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Please enter name';
//                           }
//                           return null;
//                         },
//                         onChanged: (value) {},
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(18.0),
//                       child: TextFormField(
//                         controller: _emailController,
//                         decoration: InputDecoration(
//                             border: OutlineInputBorder(),
//                             labelText: "Receiver email"),
//                         validator: (value) {
//                           final Pattern =
//                               r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
//                           final regExp = RegExp(Pattern);
//                           if (value!.isEmpty) {
//                             return 'enter email';
//                           }
//                           if (!regExp.hasMatch(value)) {
//                             return 'enter valid email';
//                           } else {
//                             return null;
//                           }
//                         },
//                         onChanged: (value) {},
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(18.0),
//                       child: TextFormField(
//                         controller: _subjectController,
//                         decoration: InputDecoration(
//                             border: OutlineInputBorder(), labelText: "subject"),
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Please enter subject';
//                           }
//                           return null;
//                         },
//                         onChanged: (value) {},
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(18.0),
//                       child: TextFormField(
//                         keyboardType: TextInputType.multiline,
//                         maxLines: 10,
//                         controller: _msgController,
//                         decoration: InputDecoration(
//                             border: OutlineInputBorder(), labelText: "message"),
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Please enter message';
//                           }
//                           return null;
//                         },
//                         onChanged: (value) {},
//                       ),
//                     ),
//                     ElevatedButton(
//                         onPressed: () {
//                           final isValid = _formkey.currentState!.validate();
//                           if (isValid) {
//                             sendEmail();
//                           }
//                         },
//
//                         // final Email email = Email(
//                         //     recipients: [_emailController.text],
//                         //     subject: _subjectController.text,
//                         //     body: _msgController.text);
//
//                         // FlutterEmailSender.send(email);
//
//                         child: Text("send email "))
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
// class GoogleAuthApi {
//   static final _googlesignin =
//   GoogleSixgnIn(scopes: ['https://mail.google.com/']);
//
//   static Future<GoogleSignInAccount?> signIn() async {
//     if (await _googlesignin.isSignedIn()) {
//       return _googlesignin.currentUser;
//     } else {
//       return await _googlesignin.signIn();
//     }
//   }
//
//   static Future signout() => _googlesignin.signOut();
// }
