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

  static Set<Marker> marker = {};

  Completer<GoogleMapController> completer = Completer();
  static LatLng latLng;
  void getLatLong(BuildContext context){
    final prov = Provider.of<DeliMapModel>(context,listen: false);
    print(prov.getlon);
    setState(() {
      latLng =  LatLng(prov.getlat,prov.getlon);
    });
  }


  LatLng initPostition = latLng;

  onCameraMove(CameraPosition position){
    initPostition = position.target;
  }
  onMapCreated (GoogleMapController controller) {
    completer.complete(controller);
  }
  addmarker() {
    setState(() {
      marker.add(Marker(
          markerId: MarkerId(
            initPostition.toString(),
          ),
          position: initPostition,
          infoWindow: InfoWindow(title: "Your Location")));
    });
  }
  @override
  void initState() {
    super.initState();
    getLatLong(context);
    print(latLng);
    addmarker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text("Waiting for Order"),
      ),
      body: latLng.longitude == null ?
          Center(child: CircularProgressIndicator(),):
      Stack(
        children: [
          GoogleMap(
            initialCameraPosition:
            CameraPosition(target: initPostition, zoom: 11.0),
            markers: marker,
            onCameraMove: onCameraMove,
            onMapCreated: onMapCreated,
            mapType: MapType.normal,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: MaterialButton(
                height: 40,
                minWidth: MediaQuery.of(context).size.width,
                color: kThemeColor,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Good Bye"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
