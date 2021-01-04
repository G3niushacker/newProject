import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/customer_app/model/resturant/resturant_list.dart';
import 'package:food_delivery_app/customer_app/model/resturant/resturants_providers.dart';
import 'package:food_delivery_app/resturant_app/model/menu_list.dart';
import 'package:food_delivery_app/routes/routes_names.dart';
import 'package:provider/provider.dart';
import 'package:food_delivery_app/customer_app/views/home/resturants/components/menu_card.dart';



class ResturantsDetails extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<MenuLists>(context);
    final pr = Provider.of<NearResturantsProvider>(context);
    final prov = Provider.of<ResturantList>(context);
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: Text(pr.resturantDeliPrice),
              floating: true,
              pinned: true,
              expandedHeight: 200,
              leading: IconButton(
                onPressed: () async {
                  Navigator.pop(context);
                  await Future.delayed(Duration(seconds: 2));
                  pr.clearRestInfo();
                  pr.clearAllCardNItm();
                },
                icon: Icon(Icons.arrow_back),
              ),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(pr.resturantName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    )),
                background: Image.network(
                  "https://tripps.live/tripp_food/${pr.resturantImage}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: Container(
          child: ListView.builder(
            itemCount: pro.cardList.length,
            itemBuilder: (ctx,i){
              return MenuCardComponent(
                title: pro.cardList[i].cardName,
                children: pro.cardList[i].listItem,

              );
            },
          ),
        ),
      ),
      bottomNavigationBar: pr.cartItems.length == 0 ?
          Container(height: 0,
            width: 0,):
      Container(
        padding: EdgeInsets.all(10),
        child: MaterialButton(
            height: 50,
            color: kThemeColor,
            onPressed: (){
              Navigator.pushNamed(context, cartPage);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 0,
                  width: 0,
                ),
                Text("Check Out"),
                CircleAvatar(
                  radius: 13,
                  backgroundColor: Colors.white,
                  child: Text("${pr.cartItems.length}"),
                )
              ],
            )
        ),
      ),
    );
  }
}

