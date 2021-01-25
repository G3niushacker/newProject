import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/customer_app/navigation_bar/navigation_bar.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import '../../constants.dart';
import 'package:food_delivery_app/routes/routes_names.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ProfileProvider extends ChangeNotifier {
  bool isSave = false;
  File image;

  String name;
  String phone;
  String address;
  String email;
  String userid;
  String storedEmail;


  //Picking image

  Future pickImage() async {
    var sampleImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    image = sampleImage;
    notifyListeners();
  }

  //show Image for Upload

  Widget showImage() {
    if (image != null) {
      return ClipOval(
          child: Image.file(
        image,
        fit: BoxFit.fill,
        height: 120,
        width: 120,
      ));
    } else {
      return Center(
        child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: kThemeColor, width: 5)),
            child: Image.asset(
              "images/profile.png",
              height: 120,
              width: 120,
            )),
      );
    }
  }

  void isSaveForCircularProgressIntoTrue() {
    isSave = false;
  }

  // upload create user profile
  Future<dynamic>  uploadUserProfileInfo(BuildContext context) async {
    String url = "${kServerUrlName}profile.php";
   var request = await http.MultipartRequest('POST',Uri.parse(url));
   var imagee = await http.MultipartFile.fromPath('img', image.path);
   request.fields['login_id'] = userid;
   request.fields['name'] = name;
   request.fields['email'] = email;
   request.fields['phone'] = phone;
   request.fields['address'] = address;
   request.files.add(imagee);
   request.send();
  }

  // fetching user profiles
  dynamic displayName;
  dynamic displayPhone;
  dynamic displayAddress;
  dynamic diaplayImage;

  void getIdEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    userid = preferences.getString('id');
    storedEmail = preferences.getString('email');
    print(userid);
  }

  void fetchUserProfile() async {
    String url = "${kServerUrlName}fetch_userprofile.php";
    http.Response response = await http.post(url,body: ({
      'id': userid,
    }));
    var decode = json.decode(response.body);
    print(decode);
    if(decode['status'] == '1'){
      displayName = decode['profile'][0]['name'];
      displayAddress = decode['profile'][0]['address'];
      displayPhone = decode['profile'][0]['phone'];
      diaplayImage = decode['profile'][0]['profile_img'];
    }else{
      print("errorrrr");
    }
    notifyListeners();
  }


}
