import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:food_delivery_app/models/sign_up_model.dart';
import 'dart:convert';


class DeliMapModel extends ChangeNotifier{
  double lat;
  double lon;

  get getlat => lat;
  get getlon => lon;

  final Set<Marker> markers = {};

  void getUserLatMarker(_controller){
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(lat,lon), zoom: 4.475)));
    MarkerId id = MarkerId(DateTime.now().millisecondsSinceEpoch.toString());
    final Marker marker = Marker(
      markerId: id,
      position: LatLng(lat,lon),
    );
        markers.add(marker);
    notifyListeners();
  }

  void putDeliBoyOnline(context,int status) async{
    final prov = Provider.of<SignUpModel>(context,listen: false);
    String url = "${kServerUrlName}online_boy.php";
    http.Response response = await http.post(url,body: ({
      'email': prov.storedEmail,
      'status': status.toString(),
      'login_id': prov.id,
      'lat': lat.toString(),
      'long': lon.toString(),
    }));
    var dec = jsonDecode(response.body);
    print(dec);
  }
}