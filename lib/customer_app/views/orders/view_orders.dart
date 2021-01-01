import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';

class ViewOrders extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;
  final String image;
  ViewOrders({this.image, this.title, this.date, this.subtitle});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Container(
                      height: 230,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        image,
                        fit: BoxFit.fill,
                      )),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Positioned(
                    top: 190,
                    left: 20,
                    right: 0,
                    bottom: 0,
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8.0,
              ),
              Card(
                elevation: 5.0,
                child: Column(
                  children: [
                    ListTile(
                      title: Text("Deliverd"),
                      subtitle: Text(
                          "Order Number : DF5S5SD\nDelivery Address : cop 72 street 11 phase II DHA Saudi Arabia"),
                    )
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: Text("2x"),
                      title: Text(subtitle),
                      trailing: Text("SR 120"),
                    ),
                    Divider(),
                    ListTile(
                      leading: Text("Subtotal"),
                      trailing: Text("SR 120"),
                    ),
                    ListTile(
                      leading: Text("Delivery fee"),
                      trailing: Text("SR 50"),
                    ),
                    Divider(),
                    ListTile(
                      leading: Text("Total (incl, VAT)"),
                      trailing: Text("SR 170"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 50,
                  color: kThemeColor,
                  onPressed: () {},
                  child: Text(
                    "Go To Resturant",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
