import 'package:flutter/material.dart';
import 'package:fluttertask/week5/modal.dart';
import 'package:provider/provider.dart';

import 'fblogin.dart';

class glogin extends StatefulWidget {
  const glogin({Key? key}) : super(key: key);

  @override
  State<glogin> createState() => _gloginState();
}

class _gloginState extends State<glogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Social Login"),
      ),
      body: loginui(),
    );
  }

  loginui() {
    return Consumer<GooglesignInController>(builder: (context, model, child) {
      if (model.googleAccount != null) {
        return Center(child: loggedInUi(model));
      } else {
        return loginControls(context);
      }
    });
  }

  loggedInUi(GooglesignInController model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage:
              Image.network(model.googleAccount!.photoUrl ?? '').image,
          radius: 50,
        ),
        Text(model.googleAccount!.displayName ?? ''),
        Text(model.googleAccount!.email),
        ActionChip(
            avatar: Icon(Icons.logout),
            label: Text("LogOut"),
            onPressed: () {
              Provider.of<GooglesignInController>(context, listen: false)
                  .logout();
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
              child: Image.asset("image/gsignin.jpg", width: 250),
              onTap: () {
                Provider.of<GooglesignInController>(context, listen: false)
                    .login();
              }),
          // GestureDetector(
          //     child: Image.asset("image/fbsignin.jpg", width: 250),
          //     onTap: () {
          //       Provider.of<FacebookSigInController>(context, listen: false)
          //           .login();
          //     }),
          //Image.asset("image/fbsignin.jpg", width: 250),
        ],
      ),
    );
  }
}

class lgn extends StatefulWidget {
  const lgn({Key? key}) : super(key: key);

  @override
  State<lgn> createState() => _lgnState();
}

class _lgnState extends State<lgn> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GooglesignInController(),
          child: glogin(),
        ),
        // ChangeNotifierProvider(
        //   create: (context) => FacebookSigInController(), child: fblogin(),)
      ],
      child: MaterialApp(
        title: 'Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: glogin(),
      ),
    );
  }
}
