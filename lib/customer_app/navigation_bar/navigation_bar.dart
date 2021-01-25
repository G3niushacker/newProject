import 'package:flutter/material.dart';
import 'package:food_delivery_app/customer_app/model/navigation_bar_provider.dart';
import 'package:food_delivery_app/customer_app/model/profile_provider.dart';
import 'package:food_delivery_app/customer_app/services/location_service.dart';
import 'package:food_delivery_app/customer_app/views/home_page.dart';
import 'package:food_delivery_app/customer_app/views/orders/orders.dart';
import 'package:food_delivery_app/customer_app/views/profile/profile.dart';
import 'package:food_delivery_app/customer_app/views/wallet/wallet.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:food_delivery_app/customer_app/services/signup_user_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:food_delivery_app/customer_app/model/resturant/resturants_providers.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

LocationService locationService = LocationService();

class _NavigationBarState extends State<NavigationBar> {

  final allDestinations = [HOmePage(), Orders(), ProfileView(), Wallet()];

  void getLocation() async {
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    final pro = Provider.of<NearResturantsProvider>(context,listen: false);
    pro.lat = position.latitude;
    pro.lon = position.longitude;
    await Future.delayed(Duration(seconds: 3),(){
      Provider.of<ProfileProvider>(context,listen: false).fetchUserProfile();
    });
  }
  @override
  void initState(){
    super.initState();
    getLocation();
    Provider.of<ProfileProvider>(context,listen: false).getIdEmail();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NavigationProvider>(context);
    return SafeArea(
      top: false,
      child: Scaffold(
        body: IndexedStack(
          children: allDestinations,
          index: provider.index,
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (val) {
            provider.setNavBarIndex(val);
          },
          currentIndex: provider.index,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: kThemeColor,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(color: kThemeColor),
          showUnselectedLabels: true,
          unselectedLabelStyle: TextStyle(color: Colors.grey),
          items: [
            BottomNavigationBarItem(icon: Icon(LineIcons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(LineIcons.bookmark), label: "Orders"),
            BottomNavigationBarItem(
                icon: Icon(LineIcons.user), label: "Profile"),
            BottomNavigationBarItem(
                icon: Icon(LineIcons.credit_card), label: "Wallet"),
          ],
        ),
      ),
    );
  }
}
