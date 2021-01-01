import 'dart:io';
import 'package:food_delivery_app/delivery_boy_app/views/signup/components/drop_down_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:hijri_picker/hijri_picker.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:image_picker/image_picker.dart';

class DeliSignUpModel extends ChangeNotifier{
  DateTime dateTime = DateTime.now();
  Future<void> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != dateTime){
      dateTime = picked;
    }
    notifyListeners();
  }

  var selectedDate = HijriCalendar.now();
  Future<Null> selectIslamicDate(BuildContext context) async {
    HijriCalendar.setLocal(Localizations.localeOf(context).languageCode);
    final HijriCalendar picked = await showHijriDatePicker(
      context: context,
      initialDate: selectedDate,

      lastDate:  HijriCalendar()
        ..hYear = 1445
        ..hMonth = 9
        ..hDay = 25,
      firstDate:  HijriCalendar()
        ..hYear = 1438
        ..hMonth = 12
        ..hDay = 25,
      initialDatePickerMode: DatePickerMode.day,
    );
    if (picked != null) {
      selectedDate = picked;
    }
    notifyListeners();
  }

  File selfie;
  File idFront;
  File idBack;
  File licence;
  File vahicleDoc;

  Future pickSelfieImage() async {
    var sampleImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    selfie = sampleImage;
    notifyListeners();
  }

  Widget showSelfieImage() {
    if (selfie != null) {
      return Image.file(
        selfie,
        fit: BoxFit.fill,
        // height: 120,
        // width: 120,
      );
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

  Future pickIdFront() async {
    var sampleImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    idFront = sampleImage;
    notifyListeners();
  }

  Widget showIDFrontImage() {
    if (idFront != null) {
      return Image.file(
        idFront,
        fit: BoxFit.fill,
        // height: 120,
        // width: 120,
      );
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

  Future pickIdBack() async {
    var sampleImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    idBack = sampleImage;
    notifyListeners();
  }

  Widget showIdBackImage() {
    if (idBack != null) {
      return Image.file(
        idBack,
        fit: BoxFit.fill,
        // height: 120,
        // width: 120,
      );
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

  Future pickLicence() async {
    var sampleImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    licence = sampleImage;
    notifyListeners();
  }

  Widget showLicenceImage() {
    if (licence != null) {
      return Image.file(
        licence,
        fit: BoxFit.fill,
        // height: 120,
        // width: 120,
      );
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

  Future pickVahicleDoc() async {
    var sampleImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    selfie = sampleImage;
    notifyListeners();
  }

  Widget showVahicleImage() {
    if (selfie != null) {
      return Image.file(
        selfie,
        fit: BoxFit.fill,
        // height: 120,
        // width: 120,
      );
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

  String cityVal = "--select city--";
  List<DropdownMenuItem> getCityList() {
    List<DropdownMenuItem<String>> list = [];
    for (var i = 0; i < dropDownCity.length; i++) {
      String city = dropDownCity[i];
      var newList = DropdownMenuItem(
        child: Text(city),
        value: city,
      );
      list.add(newList);
    }
    return list;
  }
  String countryVal = "--select country--";
  List<DropdownMenuItem> getCountryList() {
    List<DropdownMenuItem<String>> list = [];
    for (var i = 0; i < dropDownCountry.length; i++) {
      String country = dropDownCountry[i];
      var newList = DropdownMenuItem(
        child: Text(country),
        value: country,
      );
      list.add(newList);
    }
    return list;
  }

  void setCityVal(String val){
    cityVal = val;
    notifyListeners();
  }
  void setCountryVal(String val){
    countryVal = val;
    notifyListeners();
  }
}