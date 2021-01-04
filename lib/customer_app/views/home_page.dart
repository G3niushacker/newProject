import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/customer_app/components/welcome_page.dart';
import 'package:food_delivery_app/customer_app/views/home/map_screen.dart';
import 'package:provider/provider.dart';
import 'package:food_delivery_app/routes/routes_names.dart';
import 'package:food_delivery_app/customer_app/model/resturant/resturants_providers.dart';


class HOmePage extends StatefulWidget {
  @override
  _HOmePageState createState() => _HOmePageState();
}

class _HOmePageState extends State<HOmePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text(
          kGetTranslated(context, 'home_page')
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.location_on_outlined),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MapScreen()));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            WelcomePage(
              image: "images/resturant.jpg",
              buttonTitle: "${kGetTranslated(context, 'find_resturant')}",
              ontap: () {
                final pro = Provider.of<NearResturantsProvider>(context,listen: false);
                pro.fetchNearbyResturants(context);
                Future.delayed(Duration(seconds: 1), () {
                  Navigator.pushNamed(context, resturants);
                });
              },
            ),
            WelcomePage(
              image: "images/markeet.jpg",
              buttonTitle: "${kGetTranslated(context, 'find_markeets')}",
              ontap: () {
                  Navigator.of(context).pushNamed('markeets');
              },
            ),
          ],
        ),
      ),
    );
  }
}

