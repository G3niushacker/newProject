import 'dart:convert';
import 'package:food_delivery_app/routes/routes_names.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/common_screens/veiry_email.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/common_screens/sign_up_role.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SignUpModel extends ChangeNotifier {
  bool isSignUp = true;
  bool isLoading = false;
  bool isCodeSent = false;
  String email;
  String password;
  dynamic id;
  String code;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  var _verificationId;

  void setEmail(String val){
    email = val;
  }
  void setPass(String val){
    password = val;
  }

  void setCode(String val){
    code = val;
  }

  // Signup user with phone number
  void onVerifyCode(String number, BuildContext context, countryCode) async {
    isCodeSent = true;
    final PhoneVerificationCompleted verificationCompleted =
        (AuthCredential phoneAuthCredential) {
      _firebaseAuth
          .signInWithCredential(phoneAuthCredential)
          .then((UserCredential value) {
        if (value.user.displayName != null && value.user != null) {
          // Handle loogged in state
          print(value.user.phoneNumber);
//           Navigator.pushAndRemoveUntil(
//               context,
//               MaterialPageRoute(
//                 builder: (context) =>BottomNavBar(
// //                  user: value.user,
//                 ),
//               ),
//                   (Route<dynamic> route) => false);
        } else if (value.user != null && value.user.displayName == null) {
          MaterialPageRoute(
            builder: (context) => SignRole(),
          );
        } else {
          Text("Error validating OTP, try again");
        }
      }).catchError((error) {
        Text("Something went wrong");
      });
    };
    final PhoneVerificationFailed verificationFailed = (authException) {
      Text(authException.message);
      isCodeSent = false;
    };

    final PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      _verificationId = verificationId;
    };
    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      _verificationId = verificationId;
    };

    await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: "$countryCode$number",
        timeout: const Duration(seconds: 60),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  // on code submit
  void onFormSubmitted(
      TextEditingController _pinEditingController, BuildContext context) async {
    AuthCredential _authCredential = PhoneAuthProvider.getCredential(
        verificationId: _verificationId, smsCode: _pinEditingController.text);

    _firebaseAuth
        .signInWithCredential(_authCredential)
        .then((UserCredential value) {
      if (value.user != null && value.user.displayName != null) {
        // Handle loogged in state
        print(value.user.phoneNumber);
//         Navigator.pushAndRemoveUntil(
//             context,
//             MaterialPageRoute(
//               builder: (context) => BottomNavBar(
// //                user: value.user,
//               ),
//             ),
//                 (Route<dynamic> route) => false);
      } else if (value.user.displayName == null && value.user != null) {
        MaterialPageRoute(
          builder: (context) => SignRole(),
        );
      } else {
        Text("Error validating OTP, try again");
      }
    }).catchError((error) {
      Text("Something went wrong");
    });
  }

  // signup into signin by bool value
  void changeIntoSignup() {
    isSignUp = !isSignUp;
    notifyListeners();
  }

  // showing error for email sign up
  showError(_error) {
    if (_error != null) {
      return Container(
        color: Colors.yellow,
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.error_outline,
              color: Colors.red,
            ),
            SizedBox(
              width: 5.0,
            ),
            Expanded(
              child: Text(
                _error,
                style: kEmailError,
              ),
            )
          ],
        ),
      );
    } else {
      return SizedBox(
        height: 0,
      );
    }
  }

  // signUp user with email password
  void signUpUser(BuildContext context) async {
    print(email);
    print(password);
    var url =
        "${kServerUrlName}signup.php";
    http.Response response = await http.post(url,
        body: ({
          'email': email,
          'password': password,
        }),
        headers: {'Accept': 'application/json'});
    if(response.statusCode == 200){
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => VerifyEmail()));
      storeValInSharedPref();
    }
  }

  // signin user
  void signInUser(BuildContext context) async {
    String url = "${kServerUrlName}login.php";
    http.Response response = await http.post(url,body: ({
      'email':email,
      'pass':password,
    }));
    var de = jsonDecode(response.body);
    print(de);
    notifyListeners();
  }

   storeValInSharedPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('email', email);
    preferences.setString('id', id);
  }
   getStoredEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var em = preferences.getString('email');
    print(em);
    return em;
  }
  getStoredId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var id = preferences.getString('id');
    print(id);
    return id;
  }

  verifyEmail(BuildContext context) async {
    // getStoredEmail();
    // getStoredId();
    print(email);
    print(code);
    String url =
        "${kServerUrlName}verification.php";
    http.Response response = await http.post(url,body: ({
      'email' : email,
      'code' : code,
    }));
    var decode = jsonDecode(response.body);
    print(decode);
    if(decode['login'][0]['status'] == '1'){
      email = decode['login'][0]['email'];
      id = decode['login'][0]['id'];
      storeValInSharedPref();
      Navigator.pushReplacementNamed(context, signRole);
    }else{
      print("error");
    }
  }

  void roleUpdate(int index) async {
    String url = "${kServerUrlName}role.php";
    if(index == 1){
      http.Response response = await http.post(url,body: ({
        'id': id,
        'email': email,
        'role': index.toString(),

      }));
    }else if(index == 2){
      http.Response response = await http.post(url,body: ({
        'id': id,
        'email': email,
        'role': index.toString(),

      }));
    }else{
      http.Response response = await http.post(url,body: ({
        'id': id,
        'email': email,
        'role': index.toString(),
      }));
    }
  }

}
