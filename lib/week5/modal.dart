import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class GooglesignInController with ChangeNotifier {
  var googlesignin = GoogleSignIn();
  GoogleSignInAccount? googleAccount;

  login() async {
    this.googleAccount = await googlesignin.signIn();
    notifyListeners();
  }

  logout() async {
    this.googleAccount = await googlesignin.signOut();
    notifyListeners();
  }
}



class FacebookSigInController with ChangeNotifier{
  Map? userData;

  login() async {
    var result = await FacebookAuth.i.login(
      permissions: ["public_profile","email"]
    );
    if(result.status == LoginStatus.success){
      final requestData = await FacebookAuth.i.getUserData(
        fields: "email,name,picture",
      );
      userData=requestData;
      notifyListeners();
    }
  }

  logOut()async{
    await FacebookAuth.i.logOut();
    userData = null;
    notifyListeners();
  }
}