import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/resturant_app/model/resturant_menu_provider.dart';
import 'package:food_delivery_app/resturant_app/views/home/menu/add_more_menu_fields.dart';
import 'package:food_delivery_app/resturant_app/views/home/menu/components/offer_card.dart';
import 'package:food_delivery_app/resturant_app/views/home/menu/components/add_card_bottom_sheet.dart';
import 'package:food_delivery_app/resturant_app/model/menu_list.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MenuLists>(context);
    final pro = Provider.of<MenuProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
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
              itemCount:
                  provider.cardList != null && provider.cardList.length > 0
                      ? provider.cardList.length
                      : 0,
              itemBuilder: (ctx, i) {
                var list = provider.cardList;
                if (list == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return OfferCard(
                    addItems: (){
                      pro.getCardId = provider.cardList[i].cardId;
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => AddMoreMenuFields()
                      ));
                    },
                    children: provider.cardList[i].listItem,
                    title: provider.cardList[i].cardName,
                    price: provider.cardList[i].cardMinPrice,
                  );
                }
              },
            ),
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
                                  child: Container(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom),
                                child: AddCardBottomSheet(),
                              )));
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
// delet: (){
// menuProvider.deleteCard(list[i].cardId, context, i);
// },
// edit: (){
// print(list[i].cardName);
// menuProvider.assignValue(list[i].cardName, list[i].cardMinPrice);
// menuProvider.assignCardId(list[i].cardId);
// showModalBottomSheet(
// context: context,
// isScrollControlled: true,
// builder: (context) => SingleChildScrollView(
// child:Container(
// padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
// child: EditMenuCard(),
// )
// )
// );
// },
