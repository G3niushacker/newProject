import 'package:flutter/material.dart';
import 'package:food_delivery_app/common_screens/sign_up_welcome_screen.dart';
import 'package:food_delivery_app/resturant_app/views/home/components/circular_indicator.dart';
import 'package:food_delivery_app/resturant_app/views/home/menu/menu_page.dart';
import 'package:food_delivery_app/resturant_app/views/recent_orders.dart';
import 'package:food_delivery_app/resturant_app/views/wallet/wallet.dart';
import 'package:food_delivery_app/resturant_app/views/contact_us.dart';
import 'package:food_delivery_app/resturant_app/views/how_it_work.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery_app/resturant_app/views/signup/personal_information.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery_app/resturant_app/services/firebase_user_id.dart';
import 'package:provider/provider.dart';
import 'package:food_delivery_app/resturant_app/model/resturant_profile_provider.dart';
import 'package:food_delivery_app/resturant_app/model/resturant_menu_provider.dart';

final topCardsubhead = TextStyle(color: Colors.grey[700], fontSize: 20);
final topCardHead = TextStyle(color: Colors.black, fontSize: 25);

class ResturantHomePage extends StatefulWidget {
  @override
  _ResturantHomePageState createState() => _ResturantHomePageState();
}

class _ResturantHomePageState extends State<ResturantHomePage> {

  @override
  void initState() {
    super.initState();
    final prov = Provider.of<ResturantProfileProvider>(context,listen: false);
    prov.fetchResturantProfile();
  }

  @override
  Widget build(BuildContext context) {
    final textThem = Theme.of(context).textTheme;
    final provider = Provider.of<ResturantProfileProvider>(context);
    final menuProvider = Provider.of<MenuProvider>(context);
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      ClipOval(
                        child: provider.profileImage ==
                                null
                            ? Image.asset(
                                "images/user.png",
                                height: 90,
                                width: 90,
                              )
                            : Image.network(
                          'https://tripps.live/tripp_food/${provider.profileImage}',
                                height: 80,
                                width: 80,
                                fit: BoxFit.fill,
                              ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        provider.profileName ?? "Loading...",
                        style: TextStyle(fontSize: 20),
                      ),
                      provider.avaluateRating(),
                      Text("Rating ${provider.rating}.0")
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.settings,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Divider(),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              title: Text("Home"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecentOrders(),
                  ),
                );
              },
              title: Text("Orders History"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResturantWallet(),
                  ),
                );
              },
              title: Text("Wallet"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResturantPersonalInfo(),
                  ),
                );
              },
              title: Text("How it works"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResturantContactUs(),
                  ),
                );
              },
              title: Text("Contact Us"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            FlatButton(
              onPressed: () {

              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.exit_to_app),
                  Text("Log Out"),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          "Dashboard",
          style: textThem.headline2,
        ),
        actions: [
          IconButton(
            onPressed: () {
              menuProvider.fetchMenuCards(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MenuPage(),
                ),
              );
            },
            icon: Icon(Icons.my_library_books_outlined),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                elevation: 5.0,
                child: Container(
                  height: MediaQuery.of(context).size.height / 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              "Weekly Report",
                              style: TextStyle(color: Colors.green),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Earinings",
                                style: topCardsubhead,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "SR 1100",
                                style: topCardHead,
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Orders",
                                style: topCardsubhead,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "16",
                                style: topCardHead,
                              )
                            ],
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Rating",
                                style: topCardsubhead,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "5.0",
                                style: topCardHead,
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Cancel",
                                style: topCardsubhead,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "3",
                                style: topCardHead,
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircularIndicator(
                      color: Colors.green,
                      percent: 0.9,
                      prcntiner: "90%",
                      title: "Earnings",
                    ),
                    CircularIndicator(
                      color: Colors.orange,
                      percent: 0.8,
                      prcntiner: "30%",
                      title: "Orders",
                    ),
                    CircularIndicator(
                      color: Colors.green,
                      percent: 1.0,
                      prcntiner: "100%",
                      title: "Rating",
                    ),
                    CircularIndicator(
                      color: Colors.red,
                      percent: 0.3,
                      prcntiner: "30%",
                      title: "Cancel",
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent Orders",
                    style: textThem.bodyText1,
                  ),
                  FlatButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RecentOrders()));
                    },
                    child: Text("See all"),
                  )
                ],
              ),
              Card(
                child: ListTile(
                  leading: ClipOval(
                    child: Image.asset(
                      "images/user.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  title: Text("Umer hijaz"),
                  subtitle: Text("cop 72 phase 2 DHA Saudi Arebia"),
                  trailing: Text("12/12/2020"),
                ),
              ),
              Card(
                child: ListTile(
                  leading: ClipOval(
                    child: Image.asset("images/user.png"),
                  ),
                  title: Text("Muhammad ali"),
                  subtitle: Text("strea phase 2 DHA Saudi Arebia"),
                  trailing: Text("12/12/2020"),
                ),
              ),
              Card(
                child: ListTile(
                  leading: ClipOval(
                    child: Image.asset("images/user.png"),
                  ),
                  title: Text("Umer hijaz"),
                  subtitle: Text("cop 72 phase 2 DHA Saudi Arebia"),
                  trailing: Text("12/12/2020"),
                ),
              ),
              Card(
                child: ListTile(
                  leading: ClipOval(
                    child: Image.asset("images/user.png"),
                  ),
                  title: Text("Umer hijaz"),
                  subtitle: Text("cop 72 phase 2 DHA Saudi Arebia"),
                  trailing: Text("12/12/2020"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
