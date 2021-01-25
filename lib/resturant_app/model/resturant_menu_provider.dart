import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/resturant_app/model/menu_list.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/resturant_app/model/menu_card_model.dart';
import 'package:food_delivery_app/resturant_app/model/menu_card_item_model.dart';

class MenuProvider extends ChangeNotifier {
  String cardName;
  String cardMinPrice;
  dynamic cardID;

  String itemName;
  String itemPrice;
  String itemDescription;
  File itemImage;
  dynamic getCardId;

  Future pickItemImage() async {
    var sampleImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    itemImage = sampleImage;
    notifyListeners();
  }

  //show Image for Upload

  Widget showItemImage() {
    if (itemImage != null) {
      return Image.file(
        itemImage,
        fit: BoxFit.fill,
        height: 120,
        width: 120,
      );
    } else {
      return Center(
        child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: kThemeColor, width: 5)),
            child: Image.asset(
              "images/profile.png",
              height: 120,
              width: 120,
            )),
      );
    }
  }

  // add resturant menu cards

  void addMenuCard() async {
    String url = "${kServerUrlName}resturant_card.php";
    http.Response response = await http.post(url,
        body: ({
          'email': 'business@email.com',
          'login_id': '9',
          'card_name': cardName,
          'min_price': cardMinPrice,
        }));
    var decode = jsonDecode(response.body);
    notifyListeners();
  }

  void callFetchFun(context) {
    fetchMenuCards(context);
    notifyListeners();
  }

  void addCardItems() async {
    String url = "${kServerUrlName}resturant_item.php";
    var request = await http.MultipartRequest('POST',Uri.parse(url));
    var imagee = await http.MultipartFile.fromPath('file', itemImage.path);
    request.fields['item_description'] = itemDescription;
    request.fields['card_id'] = getCardId;
    request.fields['item_name'] = itemName;
    request.fields['item_price'] = itemPrice;
    request.files.add(imagee);
    request.send();
    getCardId = null;
    notifyListeners();
  }

  // fetch all resturant cards and items

  void fetchMenuCards(context) async {
    String url = "${kServerUrlName}fetch_resturant_card.php";
    http.Response response = await http.post(url,
        body: ({
          'resturant_id': '9',
        }));
    var decodee = jsonDecode(response.body);
    List<MenuCardItemsModel> lstItems;

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

  // fetch menu card items
  void fetchMenuCardItems(context) async {
    String url = "${kServerUrlName}fetch_card_item.php";
    http.Response response = await http.post(url,
        body: ({
          'card_id': cardID,
        }));
    var decodee = jsonDecode(response.body);
    final pro = Provider.of<MenuLists>(context, listen: false);
    pro.clearAllList();
    for (var decode in decodee['data']) {
      pro.itemList.add(MenuCardItemsModel(
        itemPrice: decode['item_price'],
        itemName: decode['item_name'],
        itemDescription: decode['item_description'],
        itemImage: decode['itme_img'],
        itemId: decode['item_id'],
        cardId: decode['item_price'],
      ));
    }
    notifyListeners();
    print(decodee);
  }

  void deleteCard(dynamic cardId, context, int index) async {
    String url = "${kServerUrlName}del_card.php";
    http.Response response = await http.post(url,
        body: ({
          'card_id': cardId,
          'resturant_id': '20',
        }));
    final pro = Provider.of<MenuLists>(context, listen: false);
    pro.deleteCardFromIndex(index);
    fetchMenuCards(context);
    notifyListeners();
  }

  TextEditingController cardNameController;
  TextEditingController cardMinPriceController;

  void assignValue(dynamic assCardName, dynamic assCardMinPri) {
    cardNameController = TextEditingController(text: assCardName);
    cardMinPriceController = TextEditingController(text: assCardMinPri);
    notifyListeners();
  }

  String editedCardName;
  String editedCardMinPrice;
  dynamic fetchedCardId;

  void assignCardId(dynamic val) {
    fetchedCardId = val;
  }

  void editMenuCard(context) async {
    String url = "${kServerUrlName}edit_card.php";
    http.Response response = await http.post(url,
        body: ({
          'card_id': fetchedCardId,
          'card_name': editedCardName,
          'min_price': editedCardMinPrice,
          'resturant_email': 'azamdirectors@gmail.com',
          'resturant_id': '20',
        }));
    fetchMenuCards(context);
  }


}
