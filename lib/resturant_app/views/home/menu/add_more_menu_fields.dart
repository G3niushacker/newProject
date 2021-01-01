import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/resturant_app/views/home/menu/components/add_menu_inputs.dart';
import 'package:image_picker/image_picker.dart';

class AddMoreMenuFields extends StatefulWidget {
  @override
  _AddMoreMenuFieldsState createState() => _AddMoreMenuFieldsState();
}

class _AddMoreMenuFieldsState extends State<AddMoreMenuFields> {
  File itmImage;
  Future pickSelfieImage() async {
    var sampleImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      itmImage = sampleImage;
    });
  }

  Widget showSelfieImage() {
    if (itmImage != null) {
      return Image.file(
        itmImage,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add More Menu Offers"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Item Name",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Item Price",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: AddMenuInputs(
                      hintText: "e.g Pizza",
                      onTap: (val) {},
                    ),
                  ),
                  Expanded(
                    child: AddMenuInputs(
                      hintText: "SR 100",
                      onTap: (val) {},
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Item Description",
                style: TextStyle(fontSize: 20),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextField(
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: "Type something about item",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Item Photo",
                style: TextStyle(fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
                child: itmImage == null
                    ? OutlineButton(
                        onPressed: () {
                          pickSelfieImage();
                        },
                        child: Text("Chose a photo"),
                      )
                    : Container(
                        height: 200,
                        child: showSelfieImage(),
                      ),
              ),
              MaterialButton(
                color: kThemeColor,
                height: 40,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Add Item",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
