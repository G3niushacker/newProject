import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/delivery_boy_app/models/signup_model.dart';
import 'package:food_delivery_app/resturant_app/views/signup/components/personal_inputs.dart';
import 'package:food_delivery_app/resturant_app/views/signup/components/personal_sceent_dropdown.dart';
import 'package:provider/provider.dart';
import 'package:food_delivery_app/routes/routes_names.dart';

class DeliBoyInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final prov = Provider.of<DeliSignUpModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Informations"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PersonalInputs(
                  hintText: 'First Name',
                  keyBordType: TextInputType.text,
                  onTap: (val){},
                ),
                PersonalInputs(
                  hintText: 'Family Name',
                  keyBordType: TextInputType.text,
                  onTap: (val){},
                ),
                PersonalInputs(
                  hintText: 'Phone Number',
                  keyBordType: TextInputType.number,
                  onTap: (val){},
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Current Address",textAlign: TextAlign.start,),
                ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (val){},
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Building No',
                        border: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.teal)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: TextField(
                      onChanged: (val){},
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Unit',
                        border: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.teal)
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (val){},
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Street Address',
                      border: OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal)
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          onChanged: (val){},
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'City',
                            border: OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.teal)
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: TextField(
                          onChanged: (val){},
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Zip Code',
                            border: OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.teal)
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                PersonalInputs(
                  hintText: 'ID Iqama Number',
                  keyBordType: TextInputType.number,
                  onTap: (val){},
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text("Iqama Expiry Date Eng"),
                        MaterialButton(
                          color: kThemeColor,
                          onPressed: (){
                            prov.selectDate(context);
                          },
                          child: Text("${prov.dateTime.toLocal()}".split(' ')[0]),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text("Iqama Expiry Date Arabic"),
                        MaterialButton(
                          color: kThemeColor,
                          onPressed: (){
                            prov.selectIslamicDate(context);
                          },
                          child: Text("${prov.selectedDate.toString()}"),
                        )
                      ],
                    )
                  ],
                ),
                DropDownMenue(
                  title: 'City',
                  items: prov.getCountryList(),
                  onchanged: (val){
                    prov.setCountryVal(val);
                  },
                  value: prov.countryVal,
                ),
                SizedBox(height: 30,),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 50,
                  color: kThemeColor,
                  minWidth: MediaQuery.of(context).size.width,
                  onPressed: (){
                    Navigator.pushNamed(context, deliDocuments);
                  },
                  child: Text("Next",
                    style: TextStyle(color: Colors.white),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
