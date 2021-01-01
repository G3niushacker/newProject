import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/customer_app/views/wallet/all_transactions.dart';

class Wallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text(
            kGetTranslated(context, 'wallet')
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                kGetTranslated(context, 'your_card'),
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                      color: kThemeColor,
                      gradient: LinearGradient(
                          colors: [Color(0xffA47B37), Color(0xffCCA760)]),
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "123 1245 566 2323",
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                        Text(
                          "Abdul Samad",
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "SR 1230",
                              style:
                                  TextStyle(fontSize: 26, color: Colors.white),
                            ),
                            Icon(FontAwesome.cc_visa),
                            // SizedBox(width: 5.0,)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      kGetTranslated(context, 'recent_transactions')
                  ),
                  FlatButton(
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AllTransactions()));
                    },
                    child: Text(
                        kGetTranslated(context, 'see_all')
                    ),
                  )
                ],
              ),
              InkWell(
                onTap: () {},
                child: Card(
                  elevation: 5.0,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text("SR 100"),
                        subtitle: Text("Arabic Resturant"),
                        trailing: Text("12/12/2020"),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Card(
                  elevation: 5.0,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text("SR 100"),
                        subtitle: Text("Arabic Resturant"),
                        trailing: Text("12/12/2020"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
