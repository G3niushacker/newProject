import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/localization/demo_localization.dart';
import 'package:food_delivery_app/routes/custom_routes.dart';
import 'package:food_delivery_app/routes/routes_names.dart';
import 'package:provider/provider.dart';
import 'package:food_delivery_app/customer_app/model/navigation_bar_provider.dart';
import 'package:food_delivery_app/customer_app/model/profile_provider.dart';
import 'package:food_delivery_app/customer_app/services/location_service.dart';
import 'package:food_delivery_app/customer_app/services/signup_user_service.dart';
import 'package:food_delivery_app/models/sign_up_model.dart';
import 'package:food_delivery_app/resturant_app/model/resturant_profile_provider.dart';
import 'package:food_delivery_app/resturant_app/model/resturant_menu_provider.dart';
import 'package:food_delivery_app/resturant_app/model/menu_list.dart';
import 'package:food_delivery_app/customer_app/model/resturant/resturant_list.dart';
import 'package:food_delivery_app/customer_app/model/resturant/resturants_providers.dart';
import 'package:food_delivery_app/delivery_boy_app/models/signup_model.dart';
import 'package:food_delivery_app/delivery_boy_app/models/deli_map_model.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState state = context.findRootAncestorStateOfType<_MyAppState>();
    state.setLocale(locale);
  }
}

class _MyAppState extends State<MyApp> {
  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  Locale _locale;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignUpModel>(
          create: (context) => SignUpModel(),
        ),
        ChangeNotifierProvider<ProfileProvider>(
          create: (context) => ProfileProvider(),
        ),
        ChangeNotifierProvider<NavigationProvider>(
          create: (context) => NavigationProvider(),
        ),
        ChangeNotifierProvider<SignUpUserService>(
          create: (context) => SignUpUserService(),
        ),
        ChangeNotifierProvider<LocationService>(
          create: (context) => LocationService(),
        ),
        ChangeNotifierProvider<ResturantProfileProvider>(
          create: (context) => ResturantProfileProvider(),
        ),
        ChangeNotifierProvider<MenuProvider>(
          create: (context) => MenuProvider(),
        ),
        ChangeNotifierProvider<MenuLists>(
          create: (context) => MenuLists(),
        ),
        ChangeNotifierProvider<NearResturantsProvider>(
          create: (context) => NearResturantsProvider(),
        ),
        ChangeNotifierProvider<ResturantList>(
          create: (context) => ResturantList(),
        ),
        ChangeNotifierProvider<DeliSignUpModel>(
          create: (context) => DeliSignUpModel(),
        ),
        ChangeNotifierProvider<DeliMapModel>(
          create: (context) => DeliMapModel(),
        ),
      ],
      child: MaterialApp(
        supportedLocales: [Locale('ar', 'SA'), Locale('en', 'US')],
        locale: _locale,
        localizationsDelegates: [
          DemoLocalization.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        localeListResolutionCallback: (deviceLocal, supportedLocal) {
          var languageCode;
          var countryCode;
          for (var loc in deviceLocal) {
            languageCode = loc.languageCode;
            countryCode = loc.countryCode;
          }
          for (var locale in supportedLocal) {
            if (locale.languageCode == languageCode &&
                locale.countryCode == countryCode) {
              return deviceLocal.first;
            }
          }
          return supportedLocal.first;
        },
        debugShowCheckedModeBanner: false,
        title: 'Food Delivery App',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: kThemeColor,
            centerTitle: true,
            elevation: 0.0,
          ),
          textTheme: TextTheme(
            headline2: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.w500),
            bodyText1: TextStyle(fontFamily: 'Raleway'),
          ),
        ),
        onGenerateRoute: CustomRoutes.allRoutes,
        initialRoute: navigationBar,
      ),
    );
  }
}
