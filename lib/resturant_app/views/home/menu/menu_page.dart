import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/resturant_app/views/home/menu/components/offer.dart';
import 'package:food_delivery_app/resturant_app/views/home/menu/components/offer_card.dart';
import 'package:food_delivery_app/resturant_app/views/home/menu/components/add_card_bottom_sheet.dart';
import 'package:food_delivery_app/resturant_app/model/menu_list.dart';
import 'package:food_delivery_app/resturant_app/model/resturant_menu_provider.dart';
import 'package:provider/provider.dart';
import 'package:food_delivery_app/resturant_app/views/home/menu/edit_menu_cards.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MenuLists>(context);
    final menuProvider = Provider.of<MenuProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            provider.clearAllList();
            Navigator.pop(context);
          },
        ),
        title: Text("Your Menu"),
      ),
      body: SingleChildScrollView(

        child: Column(
          children: [
          ListView.builder(
          shrinkWrap: true,
          itemCount: provider.cardList.length,
          itemBuilder: (ctx,i){
            var list = provider.cardList;
            var itmcond = provider.itemList[i].cardId;
            var crdcond = provider.cardList[i].cardId;
            // print("flag 1 ${itmcond}");
            // print("flag 2 ${crdcond}");
            if(list == null){
              return Center(child: CircularProgressIndicator(),);
            }else{
              return OfferCard(
                delet: (){
                  menuProvider.deleteCard(list[i].cardId, context, i);
                },
                edit: (){
                  print(list[i].cardName);
                  menuProvider.assignValue(list[i].cardName, list[i].cardMinPrice);
                  menuProvider.assignCardId(list[i].cardId);
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => SingleChildScrollView(
                          child:Container(
                            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                            child: EditMenuCard(),
                          )
                      )
                  );
                },
                title: provider.cardList[i].cardName,
                price: "from SAR ${list[i].cardMinPrice}",
                children: [
                  // Offer(
                  //   title: itmcond ==  crdcond ?? provider.itemList[i].itemName,
                  // )
                ],
              );
            }
          },
        ),
            OfferCard(
              title: "New Arrival",
              price: "from SR 500.00",
              children: [
                Offer(
                  title: "Asian Dish",
                  discription:
                      "small asian pizza now available in our resturant",
                  image: "images/food.png",
                ),
                Offer(
                  title: "Pakistani Food",
                  discription: "Pakistani Sweet dish with testy swalish",
                  image: "images/engRest.jpg",
                ),
              ],
            ),
            // OfferCard(
            //   title: "Pizza's",
            //   price: "from SR 140.00",
            //   children: [
            //     Offer(
            //       title: "American Pizza",
            //       discription:
            //           "American pizza and get more spicy any 6 inch pizza ",
            //       image: "images/pizza.jpg",
            //     ),
            //   ],
            // ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Add More Menu Fields",
                    textAlign: TextAlign.center,
                  ),
                  MaterialButton(
                    color: kThemeColor,
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) => SingleChildScrollView(
                              child:Container(
                                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                                child: AddCardBottomSheet(),
                              )
                          )
                      );
                    },
                    child: Text(
                      "Add",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
