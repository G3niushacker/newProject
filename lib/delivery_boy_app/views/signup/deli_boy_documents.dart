import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/delivery_boy_app/models/signup_model.dart';
import 'package:food_delivery_app/resturant_app/views/signup/components/general_detail_card.dart';
import 'package:food_delivery_app/resturant_app/views/signup/components/general_information_card_contnet.dart';
import 'package:provider/provider.dart';

class DeliBoyDocuments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DeliSignUpModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Documents"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Cards(
                    ontap: () {
                      provider.pickSelfieImage();
                    },
                    colour: kThemeColor,
                    cardChild: provider.selfie == null
                        ? IconContent(
                      icon: Icons.camera_alt,
                      gender: "Your Selfie",
                    )
                        : provider.showSelfieImage(),
                  ),
                ),
                Expanded(
                  child: Cards(
                    ontap: () {
                      provider.pickLicence();
                    },
                    colour: kThemeColor,
                    cardChild: provider.licence == null
                        ? IconContent(
                      icon: Icons.camera_alt,
                      gender: "Your Licence",
                    )
                        : provider.showLicenceImage(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Cards(
                    ontap: () {
                      provider.pickIdFront();
                    },
                    colour: kThemeColor,
                    cardChild: provider.idFront == null
                        ? IconContent(
                      icon: Icons.camera_alt,
                      gender: "ID Front",
                    )
                        : provider.showIDFrontImage(),
                  ),
                ),
                Expanded(
                  child: Cards(
                    ontap: () {
                      provider.pickIdBack();
                    },
                    colour: kThemeColor,
                    cardChild: provider.idBack == null
                        ? IconContent(
                      icon: Icons.camera_alt,
                      gender: "ID Back",
                    )
                        : provider.showIdBackImage(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Cards(
                    ontap: () {
                      provider.pickVahicleDoc();
                    },
                    colour: kThemeColor,
                    cardChild: provider.vahicleDoc == null
                        ? IconContent(
                      icon: Icons.camera_alt,
                      gender: "Vehicle Documents",
                    )
                        : provider.showVahicleImage(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              height: 50,
              color: kThemeColor,
              minWidth: MediaQuery.of(context).size.width,
              onPressed: (){
                // Navigator.pushNamed(context, deliDocuments);
              },
              child: Text("Next",
                style: TextStyle(color: Colors.white),),
            ),
          )
        ],
      ),
    );
  }
}
