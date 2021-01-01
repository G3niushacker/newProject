import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
import 'components/resturant_card.dart';
import 'package:provider/provider.dart';
import 'package:food_delivery_app/customer_app/model/resturant/resturants_providers.dart';
import 'package:food_delivery_app/customer_app/model/resturant/resturant_list.dart';

class Resturants extends StatefulWidget {
  @override
  _ResturantsState createState() => _ResturantsState();
}

class _ResturantsState extends State<Resturants> {


  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<ResturantList>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            prov.clearAllList();
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 36 + 20.0,
                    ),
                    margin: EdgeInsets.only(bottom: 10 * 1.5),
                    height: MediaQuery.of(context).size.height / 4,
                    decoration: BoxDecoration(
                        color: kThemeColor,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(50),
                            bottomLeft: Radius.circular(50))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          kGetTranslated(context, 'resturants'),
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Icon(
                          Icons.food_bank,
                          color: Colors.white,
                          size: 50,
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 54,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 50,
                                color: Colors.black.withOpacity(0.30))
                          ]),
                      child: Center(
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: kGetTranslated(context, 'search_resturants'),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              suffixIcon: Icon(Icons.search)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [Text(kGetTranslated(context, 'nearby_resturants'))],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: prov.resturantList.length,
                    itemBuilder: (ctx,i){
                      return ResturantCard(
                        title: prov.resturantList[i].bName,
                        image: "https://tripps.live/tripp_food/${prov.resturantList[i].resturantSelfie}",
                        deleveryFee: prov.resturantList[i].minimum,
                        minRate: prov.resturantList[i].startFrom,
                        subtitle: prov.resturantList[i].description,
                      );
                    },
                  ),
                  // ResturantCard(
                  //   title: "Arabic Resturant",
                  //   subtitle:
                  //       "Camel Korma, Meat korma, Kabaab, salad , suit pasti, naaan",
                  //   image: "images/arabicRest.jpg",
                  //   minRate: "99",
                  //   deleveryFee: "50",
                  // ),
                  // ResturantCard(
                  //   title: "Safari Resturant",
                  //   subtitle:
                  //       "Camel Korma, Meat korma, Kabaab, salad , suit pasti, naaan",
                  //   image: "images/safariRest.jpg",
                  //   minRate: "80",
                  //   deleveryFee: "100",
                  // ),
                  // ResturantCard(
                  //   title: "Fast Food",
                  //   subtitle:
                  //       "Camel Korma, Meat korma, Kabaab, salad , suit pasti, naaan",
                  //   image: "images/fastFoodRest.jpg",
                  //   minRate: "99",
                  //   deleveryFee: "50",
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
