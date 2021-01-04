import 'package:flutter/foundation.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/resturant_app/model/menu_card_item_model.dart';
import 'package:food_delivery_app/resturant_app/model/menu_card_model.dart';
import 'package:food_delivery_app/resturant_app/model/menu_list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:food_delivery_app/customer_app/model/resturant/resturant_list.dart';
import 'package:food_delivery_app/customer_app/model/resturant/resturants_model.dart';

class NearResturantsProvider extends ChangeNotifier{
  double lat;
  double lon;
  dynamic cardID;
  dynamic resturantId;

  dynamic resturantName;
  dynamic resturantImage;
  dynamic resturantDeliPrice;



  List<MenuCardItemsModel> lstItems;
  void fetchNearbyResturants(context) async {
    String url = "${kServerUrlName}fetch_all_resturant.php";
    http.Response response = await http.post(url,body: ({
      'lat':lat.toString(),
      'long':lon.toString(),
    }));
    var decode = json.decode(response.body);
    final pro = Provider.of<ResturantList>(context,listen: false);
    pro.resturantList.clear();
    for(var dec in decode['data']){
      pro.resturantList.add(
        ResturantsModel(
          bName: dec['b_name'],
          description: 'Pixxa smalll large burger etc popkomn',
          id: dec['id'],
          resturantSelfie: dec['resutrant_selfie'],
          minimum: '59',
          rating: 5.0,
          ratingLength: '15',
          deliFee: '25'
        )
      );
    }
    print(decode);
    notifyListeners();
  }

  void fetchMenuCards(context) async {
    String url = "${kServerUrlName}fetch_resturant_card.php";
    http.Response response = await http.post(url,
        body: ({
          'resturant_id': resturantId,
        }));
    var decodee = jsonDecode(response.body);


    if (response.statusCode == 200) {
      lstItems = List();
      String url1 = "${kServerUrlName}fetch_card_item.php";
      http.Response response1 = await http.post(
        url1,
      );
      var decode1 = jsonDecode(response1.body);

      for (var decode in decode1['data']) {
        lstItems.add(MenuCardItemsModel(
          itemPrice: decode['item_price'],
          itemName: decode['item_name'],
          itemDescription: decode['item_description'],
          itemImage: decode['itme_img'],
          itemId: decode['item_id'],
          cardId: decode['card_id'],
        ));
      }
    }
    final pro = Provider.of<MenuLists>(context, listen: false);
    pro.clearAllList();
    for (var decode in decodee['data']) {
      cardID = decode['card_id'];
      print(decode['card_id']);
      List<MenuCardItemsModel> lstCardItems = List();
      for (MenuCardItemsModel tempItem in lstItems) {
        if (tempItem.cardId == cardID) {
          lstCardItems.add(tempItem);
        }
      }
      pro.cardList.add(MenuCardModel(
        cardMinPrice: decode['min_price'],
        cardName: decode['card_name'],
        cardId: decode['card_id'],
        listItem: lstCardItems,
      ));
    }
    notifyListeners();
    print(decodee);
  }


  void fetchResturantInfo()async {
    String url = "${kServerUrlName}fetch_res_info.php";
    http.Response response = await http.post(url,body: ({
      'resturant_id' : resturantId,
    }));
    var decode = jsonDecode(response.body);
    if(response.statusCode == 200){
      resturantName = decode['data'][0]['b_name'];
      resturantImage = decode['data'][0]['resutrant_selfie'];
      resturantDeliPrice = decode['data'][0]['deli_price'];
    }
    notifyListeners();
  }

  List<MenuCardItemsModel> cartItems = [];

  var elements = ["a", "b", "c", "d", "e", "a", "b", "c", "f", "g", "h", "h", "h", "e"];
  var map = Map();


  void check(){
    cartItems.forEach((element) {
      if(!map.containsKey(element)){
        map[element] = 1;
      }else{
        map[element] +=1;
      }
      print(map);
    });
  }

  void addToCart(dynamic itmName, dynamic itmDesc, dynamic itmPrice,dynamic itmImage){
    cartItems.add(
        MenuCardItemsModel(
          itemPrice: itmPrice,
          itemName: itmName,
          itemImage: itmImage,
          itemDescription: itmDesc,
    ));
    notifyListeners();
  }

  void clearRestInfo(){
    resturantDeliPrice = null;
    resturantName = null;
    resturantImage = null;
    notifyListeners();
  }
  void clearAllCardNItm(){
    lstItems.clear();
    notifyListeners();
  }



}