import 'package:flutter/foundation.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:food_delivery_app/customer_app/model/resturant/resturant_list.dart';
import 'package:food_delivery_app/customer_app/model/resturant/resturants_model.dart';

class NearResturantsProvider extends ChangeNotifier{
  double lat;
  double lon;

  void fetchNearbyResturants(context) async {
    String url = "${kServerUrlName}fetch_all_resturant.php";
    http.Response response = await http.post(url,body: ({
      'lat':lat.toString(),
      'long':lon.toString(),
    }));
    var decode = json.decode(response.body);
    final pro = Provider.of<ResturantList>(context,listen: false);
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
          startFrom: '25'
        )
      );
    }
    notifyListeners();
    print(decode['data']);
    print(decode);
  }
}