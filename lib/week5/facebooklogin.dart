import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:http/http.dart' as http;

class FaceBookLoginDemo extends StatefulWidget {
  @override
  _FaceBookLoginDemoState createState() => _FaceBookLoginDemoState();
}

class _FaceBookLoginDemoState extends State<FaceBookLoginDemo> {
  static final FacebookLogin facebookSignIn = new FacebookLogin();
  String message = 'Getting Session...';
  String name = '';
  String image = '';
  String lname = '';
  String email = '';
  String buttonText = "Login";
  bool login = false;
  bool alreadyLogin = false;
  bool gettingSession = true;

  @override
  void initState() {
    super.initState();
    autoLoginCheck();
  }

  Future<void> autoLoginCheck() async {
    final bool loginCheck = await facebookSignIn.isLoggedIn;
    setState(() {
      alreadyLogin = loginCheck;
    });

    alreadyLogin ? getDataIfAlreadyLogin() : faslse();
  }

  void faslse() {
    setState(() {
      gettingSession = false;
    });
  }

  Future<void> getDataIfAlreadyLogin() async {
    var alreadyLoginToken = await facebookSignIn.accessToken;
    final graphResponse = await http.get(Uri.parse(
        'https://graph.facebook.com/v2.12/me?fields=first_name,last_name,email,picture&access_token=${alreadyLoginToken!.token}'));
    final profile = jsonDecode(graphResponse.body);
    print(profile['picture']['data']['url']);
    print(profile['first_name']);
    print(graphResponse.body);
    setState(() {
      login = true;
      gettingSession = false;
      name = profile['first_name'];
      lname = profile['last_name'];
      email = profile['email'];
      image = profile['picture']['data']['url'];
      buttonText = "Logout";
    });
    _showMessage('''
         Logged in!
         Token: ${alreadyLoginToken.token}
         User id: ${alreadyLoginToken.userId}
         Expires: ${alreadyLoginToken.expires}
         Permissions: ${alreadyLoginToken.permissions}
         Declined permissions: ${alreadyLoginToken.declinedPermissions}
         ''');
  }

  Future<Null> _login() async {
    // final FacebookLoginResult result = await facebookSignIn.logIn(permissions: ['email']);
    final result = await FacebookAuth.instance.login(permissions: ['email']);
    switch (result.status) {
      case LoginStatus.success:
        final AccessToken? accessToken = result.accessToken;
        final graphResponse = await http.get(Uri.parse(
            'https://graph.facebook.com/v2.12/me?fields=first_name,last_name,email,picture&access_token=${accessToken!.token}'));
        final profile = jsonDecode(graphResponse.body);
        print(profile['picture']['data']['url']);
        print(graphResponse.body);
        setState(() {
          login = true;
          name = profile['first_name'];
          lname = profile['last_name'];
          email = profile['email'];
          image = profile['picture']['data']['url'];
          buttonText = "Logout";
        });
        _showMessage('''
         Logged in!
         Token: ${accessToken.token}
         User id: ${accessToken.userId}
         Expires: ${accessToken.expires}
         Permissions: ${accessToken.grantedPermissions}
         Declined permissions: ${accessToken.declinedPermissions}
         ''');
        print(accessToken.token);
        break;
      case LoginStatus.cancelled:
        _showMessage('Login cancelled by the user.');
        break;
      case LoginStatus.failed:
        setState(() {
          message = result.message!;
        });
        _showMessage('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.message}');
        break;
    }
  }

  Future<Null> _logOut() async {
    await facebookSignIn.logOut().then((value) {
      setState(() {
        login = false;
        name = '';
        lname = '';
        email = '';
        image = '';
        buttonText = "Login";
      });
    }).catchError((onError) {
      print("Error 1");
    });
    _showMessage('Logged out.');
  }

  void _showMessage(String msg) {
    setState(() {
      message = msg;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Facebook'),
      ),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            gettingSession
                ? CircularProgressIndicator()
                : login
                    ? Container(
                        child: Column(
                          children: [
                            image != ""
                                ? CircleAvatar(
                                    backgroundImage: NetworkImage(image),
                                    radius: 50,
                                    backgroundColor: Color(0x00000000),
                                  )
                                : Container(),
                            Text('${name} ${lname}'),
                            //         Text(lname),
                            Text(email),

                            // Text(message),
                            ElevatedButton(
                              onPressed: _logOut,
                              // color: Colors.red,
                              child: new Text(buttonText),
                            )
                          ],
                        ),
                      )
                    : ElevatedButton(
                        onPressed: _login,
                        child: new Text(buttonText),
                      ),
          ],
        ),
      ),
    );
  }
}
