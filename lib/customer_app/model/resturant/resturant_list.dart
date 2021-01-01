import 'package:flutter/foundation.dart';
import 'package:food_delivery_app/customer_app/model/resturant/resturants_model.dart';

class ResturantList extends ChangeNotifier{

   List<ResturantsModel> resturantList = [];

   void clearAllList(){
      resturantList.clear();
      notifyListeners();
   }

}