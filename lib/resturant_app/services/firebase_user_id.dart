import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUserId {
  var userID;
  FirebaseAuth auth = FirebaseAuth.instance;

  void getuserId() {
    var currentUser = auth.currentUser;
    var id = currentUser.uid;
    userID = id;
    print(userID);
  }
}
