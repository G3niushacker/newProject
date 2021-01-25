import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:food_delivery_app/delivery_boy_app/models/deli_map_model.dart';


class DeliMapScreen extends StatefulWidget {
  @override
  _DeliMapScreenState createState() => _DeliMapScreenState();
}

class _DeliMapScreenState extends State<DeliMapScreen> {

  Completer<GoogleMapController> completer = Completer();
  static LatLng latLng = LatLng(24.832234,67.062513);

  LatLng initPostition = latLng;

  onCameraMove(CameraPosition position){
    initPostition = position.target;
  }
  onMapCreated (GoogleMapController controller) {
    final prov = Provider.of<DeliMapModel>(context,listen: false);
    completer.complete(controller);
    prov.getUserLatMarker(controller);

  }
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<DeliMapModel>(context);
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text("Waiting for Order"),
        actions: [
          InkWell(
            onTap: (){
              Navigator.pop(context);
              prov.putDeliBoyOnline(context,1);
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage('images/shutdown.png')
                )
              ),
            ),
          )
        ],
      ),
      body: latLng.longitude == null ?
          Center(child: CircularProgressIndicator(),):
      Stack(
        children: [
          GoogleMap(
            initialCameraPosition:
            CameraPosition(target: latLng, zoom: 11.0),
            markers: prov.markers,
            onCameraMove: onCameraMove,
            onMapCreated: onMapCreated,
            mapType: MapType.normal,
          ),
        ],
      ),
    );
  }
}
