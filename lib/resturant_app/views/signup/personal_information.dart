import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/resturant_app/views/home/resturant_home.dart';
import 'package:food_delivery_app/resturant_app/views/signup/components/personal_inputs.dart';
import 'package:food_delivery_app/resturant_app/views/signup/components/personal_radio_buttons.dart';
import 'package:food_delivery_app/resturant_app/views/signup/components/personal_sceent_dropdown.dart';
import 'package:food_delivery_app/resturant_app/model/resturant_profile_provider.dart';
import 'package:provider/provider.dart';

class ResturantPersonalInfo extends StatelessWidget {
  Widget build(BuildContext context) {
    final provider = Provider.of<ResturantProfileProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "New Partner Registration",
                  style: kTopLebelStyle,
                ),
                SizedBox(
                  height: 10,
                ),
                PersonalInputs(
                  hintText: "Business Name",
                  keyBordType: TextInputType.name,
                  onTap: (val) {
                    provider.setBusinessName(val);
                  },
                ),
                DropDownMenue(
                  title: "Vertical",
                  items: provider.getProviderList(),
                  value: provider.providerValue,
                  onchanged: (val) {
                      provider.setproviderValue(val);
                  },
                ),
                DropDownMenue(
                  title: "Vertical Segment \nResturants",
                  items: provider.getSegmentList(),
                  value: provider.segments,
                  onchanged: (val) {
                    provider.setSegments(val);
                  },
                ),
                DropDownMenue(
                  title: 'Cuisine',
                  items: provider.getCuisineList(),
                  onchanged: (val) {
                    provider.setCuisine(val);
                  },
                  value: provider.cuisine,
                ),
                PersonalInputs(
                  hintText: "City",
                  keyBordType: TextInputType.text,
                  onTap: (val) {
                    provider.setCity(val);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                PersonalInputs(
                  hintText: "Business Address",
                  keyBordType: TextInputType.streetAddress,
                  onTap: (val) {
                    provider.setbusinessAddress(val);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                PersonalInputs(
                  hintText: "First Name",
                  keyBordType: TextInputType.name,
                  onTap: (val) {
                    provider.setfirstName(val);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                PersonalInputs(
                  hintText: "Last Name",
                  keyBordType: TextInputType.name,
                  onTap: (val) {
                    provider.setLastName(val);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                PersonalInputs(
                  hintText: "Contact Number",
                  keyBordType: TextInputType.number,
                  onTap: (val) {
                    provider.setContact(val);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                PersonalInputs(
                  hintText: "Email",
                  keyBordType: TextInputType.emailAddress,
                  onTap: (val) {
                    provider.setEmail(val);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                PersonalInputs(
                  hintText: "Commercial Registration",
                  keyBordType: TextInputType.text,
                  onTap: (val) {
                    provider.setCommReg(val);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                PersonalInputs(
                  hintText: "Number of branches",
                  keyBordType: TextInputType.number,
                  onTap: (val) {
                    provider.setNoOfBran(val);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                PersonalRadioButtons(
                  title: "Do You Part of a franchise?",
                  grupValue: provider.doYouHaveFranchise,
                  radio1Value: 0,
                  radio2Value: 1,
                  radio1ValueOnChange: (val) {
                    provider.doYouHaveFranchiseValueChange(val);
                  },
                  radio2ValueOnChange: (val) {
                      provider.doYouHaveFranchiseValueChange(val);
                  },
                ),
                PersonalRadioButtons(
                  title: "Do You have a delivery service?",
                  grupValue: provider.doYouHaveDeliveryService,
                  radio1Value: 0,
                  radio2Value: 1,
                  radio1ValueOnChange: (val) {
                      provider.doYouHaveDeliveryServiceValueChange(val);
                  },
                  radio2ValueOnChange: (val) {
                    provider.doYouHaveDeliveryServiceValueChange(val);
                  },
                ),
                PersonalRadioButtons(
                  title: "Are you on other delivery applications?",
                  grupValue: provider.doYouHaveOtherApplications,
                  radio1Value: 0,
                  radio2Value: 1,
                  radio1ValueOnChange: (val) {
                      provider.doYouHaveOtherApplicationsValueChange(val);
                  },
                  radio2ValueOnChange: (val) {
                    provider.doYouHaveOtherApplicationsValueChange(val);
                  },
                ),
                PersonalRadioButtons(
                  title: "Are you the owner?",
                  grupValue: provider.areYouTheOwner,
                  radio1Value: 0,
                  radio2Value: 1,
                  radio1ValueOnChange: (val) {
                    provider.areYouTheOwnerValueChange(val);
                  },
                  radio2ValueOnChange: (val) {
                    provider.areYouTheOwnerValueChange(val);
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 50,
                  color: kThemeColor,
                  minWidth: MediaQuery.of(context).size.width,
                  onPressed: () {
                    provider.uploadResturantInfo(context);
                  },
                  child: Text(
                    "Submit Form",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
