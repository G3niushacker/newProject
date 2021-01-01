import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:provider/provider.dart';
import 'package:food_delivery_app/customer_app/model/profile_provider.dart';

GlobalKey<FormState> _key = GlobalKey<FormState>();

class CreateProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);
    return Scaffold(
        body: profileProvider.isSave
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: kThemeColor,
                ),
              )
            : Form(
                key: _key,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Align(child: profileProvider.showImage()),
                              Positioned(
                                top: 60,
                                left: 100,
                                right: 0,
                                bottom: 0,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.add_a_photo,
                                    size: 50,
                                    color: kThemeColor,
                                  ),
                                  onPressed: () {
                                      profileProvider.pickImage();
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          TextField(
                            onChanged: (val) {
                                profileProvider.name = val;
                            },
                            decoration: InputDecoration(
                              hintText: "Name",
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            onChanged: (val) {
                              profileProvider.address = val;
                            },
                            decoration: InputDecoration(
                              hintText: "Address",
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                                  keyboardType: TextInputType.phone,
                                  onChanged: (val) {
                                    profileProvider.phone = val;
                                  },
                                  decoration: InputDecoration(
                                    ///this is problem
                                    hintText: "Phone",
                                  ),
                                ),
                          SizedBox(
                            height: 20,
                          ),
                            TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (val) {
                                    profileProvider.email = val;
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Email",
                                  ),
                               ),
                          SizedBox(
                            height: 60,
                          ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: 50,
                            color: kThemeColor,
                            onPressed: () {
                              if (_key.currentState.validate()) {
                                _key.currentState.save();
                                  profileProvider.isSaveForCircularProgressIntoTrue();
                                  profileProvider.uploadUserProfileInfo(context);
                              }
                            },
                            child: Text(
                              "Continue",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
    );
  }
}
