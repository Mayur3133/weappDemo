import 'package:flutter/material.dart';
import 'package:fluttertask/week5/modal.dart';
import 'package:provider/provider.dart';

class fblogin extends StatefulWidget {
  const fblogin({Key? key}) : super(key: key);

  @override
  State<fblogin> createState() => _fbloginState();
}

class _fbloginState extends State<fblogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Social Login"),
      ),
      body: fbloginui(),
    );
  }

  fbloginui() {
    return Consumer<FacebookSigInController>(builder: (context, model, child) {
      if (model.userData != null) {
        return Center(child: loggedInUi(model));
      } else {
        return loginControls(context);
      }
    });
  }

  loggedInUi(FacebookSigInController model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage:
              Image.network(model.userData!["picture"]["data"]["url"] ?? '')
                  .image,
          radius: 50,
        ),
        Text(model.userData!["name"] ?? ''),
        Text(model.userData!["email"]),
        ActionChip(
            avatar: Icon(Icons.logout),
            label: Text("LogOut"),
            onPressed: () {
              Provider.of<FacebookSigInController>(context, listen: false)
                  .logOut();
            })
      ],
    );
  }

  loginControls(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          GestureDetector(
              child: Image.asset("image/fbsignin.jpg", width: 250),
              onTap: () {
                Provider.of<FacebookSigInController>(context, listen: false)
                    .login();
              }),
        ],
      ),
    );
  }
}

class facebooklogin extends StatefulWidget {
  const facebooklogin({Key? key}) : super(key: key);

  @override
  State<facebooklogin> createState() => _facebookloginState();
}

class _facebookloginState extends State<facebooklogin> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FacebookSigInController(),
          child: fblogin(),
        ),
      ],
      child: MaterialApp(
        title: 'Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: fblogin(),
      ),
    );
  }
}
