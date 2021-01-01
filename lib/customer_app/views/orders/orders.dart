import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/customer_app/views/orders/view_orders.dart';

class Orders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text(
          kGetTranslated(context, 'previous_orders')
        ),
      ),
      body: ListView(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (ctx) => ViewOrders(
                            subtitle: "Sandwich, Salad ,Burger, French fires",
                            title: "Arabic Resturant",
                            image: "images/arabicRest.jpg",
                            date: "12/02/2020",
                          )));
            },
            child: Card(
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Image.asset("images/arabicRest.jpg"),
                  title: Text("Arabic Resturant"),
                  subtitle: Text("Sandwich, Salad ,Burger, French fires"),
                  trailing: Text("12/02/2020"),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (ctx) => ViewOrders(
                            subtitle: "Patato, Salad ,Burger, French fires",
                            title: "Safari Resturant",
                            image: 'images/safariRest.jpg',
                            date: "10/02/2020",
                          )));
            },
            child: Card(
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Image.asset('images/safariRest.jpg'),
                  title: Text('Safari Resturant'),
                  subtitle: Text("Patato, Salad ,Burger, French fires"),
                  trailing: Text("10/02/2020"),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (ctx) => ViewOrders(
                            subtitle: "Sandwich, Salad ,Burger, French fires",
                            title: "English Foods",
                            image: 'images/engRest.jpg',
                            date: "08/02/2020",
                          )));
            },
            child: Card(
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Image.asset('images/engRest.jpg'),
                  title: Text("English Foods"),
                  subtitle: Text("Sandwich, Salad ,Burger, French fires"),
                  trailing: Text("08/02/2020"),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (ctx) => ViewOrders(
                            subtitle: "Patato, Salad ,Burger, French fires",
                            title: "Fast Foods",
                            image: 'images/burger.jpg',
                            date: "01/02/2020",
                          )));
            },
            child: Card(
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Image.asset('images/burger.jpg'),
                  title: Text("Fast Foods"),
                  subtitle: Text("Sandwich, Salad ,Burger, French fires"),
                  trailing: Text("01/02/2020"),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (ctx) => ViewOrders(
                            subtitle: "Patato, Salad ,Burger, French fires",
                            title: "Arabic Resturant",
                            image: 'images/arabicRest.jpg',
                            date: "10/02/2020",
                          )));
            },
            child: Card(
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Image.asset('images/arabicRest.jpg'),
                  title: Text("Arabic Resturant"),
                  subtitle: Text("Sandwich, Salad ,Burger, French fires"),
                  trailing: Text("20/01/2020"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
