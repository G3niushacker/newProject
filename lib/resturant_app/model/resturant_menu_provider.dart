import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/resturant_app/model/menu_list.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/resturant_app/model/menu_card_model.dart';
import 'package:food_delivery_app/resturant_app/model/menu_card_item_model.dart';

class MenuProvider extends ChangeNotifier{

  String cardName;
  String cardMinPrice;
  dynamic cardID;


  // add resturant menu cards

  void addMenuCard() async {
    String url = "${kServerUrlName}resturant_card.php";
    http.Response response = await http.post(url,body: ({
      'email' : 'azamdirectors@gmail.com',
      'login_id': '20',
      'card_name':cardName,
      'min_price':cardMinPrice,
    }));
    var decode = jsonDecode(response.body);
  }


  void callFetchFun(context){
    fetchMenuCards(context);
    notifyListeners();
  }


  // fetch all resturant cards and items

   void fetchMenuCards(context) async {
    String url = "${kServerUrlName}fetch_resturant_card.php";
    http.Response response = await http.post(url,body: ({
      'resturant_id': '2',
    }));
    var decodee = jsonDecode(response.body);
    final pro = Provider.of<MenuLists>(context,listen: false);
    pro.clearAllList();
    for(var decode in decodee['data']){
      cardID = decode['card_id'];
      print(decode['card_id']);
      pro.cardList.add(
        MenuCardModel(
          cardMinPrice: decode['min_price'],
          cardName: decode['card_name'],
          cardId: decode['card_id'],
        )
      );
    }
    notifyListeners();
    print(decodee);
    // print("length ${decodee['data'].length}");
    fetchMenuCardItems(context);
  }
  // fetch menu card items
  void fetchMenuCardItems(context) async {
    String url = "${kServerUrlName}fetch_card_item.php";
    http.Response response = await http.post(url,body: ({
      'card_id': '1',
    }));
    var decodee = jsonDecode(response.body);
    final pro = Provider.of<MenuLists>(context,listen: false);
    pro.clearAllList();
    for(var decode in decodee['data']){
      pro.itemList.add(
         MenuCardItemsModel(
           itemPrice: decode['item_price'],
           itemName: decode['item_name'],
           itemDescription: decode['item_description'],
           itemImage: decode['itme_img'],
           itemId: decode['item_id'],
           cardId: decode['item_price'],
         )
      );
    }
    notifyListeners();
    print(decodee);
  }

  void deleteCard(dynamic cardId,context,int index)async {
    String url = "${kServerUrlName}del_card.php";
    http.Response response = await http.post(url,body: ({
      'card_id': cardId,
      'resturant_id': '20',
    }));
    final pro = Provider.of<MenuLists>(context,listen: false);
    pro.deleteCardFromIndex(index);
    fetchMenuCards(context);
    notifyListeners();
  }

  TextEditingController cardNameController;
  TextEditingController cardMinPriceController;

  void assignValue(dynamic assCardName,dynamic assCardMinPri){
    cardNameController = TextEditingController(text: assCardName);
    cardMinPriceController = TextEditingController(text: assCardMinPri);
    notifyListeners();
  }

  String editedCardName;
  String editedCardMinPrice;
  dynamic fetchedCardId;

  void assignCardId(dynamic val){
    fetchedCardId = val;
  }

  void editMenuCard(context)async{
    String url = "${kServerUrlName}edit_card.php";
    http.Response response = await http.post(url,body: ({
      'card_id': fetchedCardId,
      'card_name': editedCardName,
      'min_price': editedCardMinPrice,
      'resturant_email': 'azamdirectors@gmail.com',
      'resturant_id': '20',
    }));
    fetchMenuCards(context);
  }

  void addCardItem(){
    String url = "${kServerUrlName}resturant_item.php";

  }

}