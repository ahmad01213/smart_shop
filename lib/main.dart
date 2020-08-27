import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_shop/screens/landing_screen.dart';
import 'package:smart_shop/screens/order_details_screen.dart';
import 'package:smart_shop/screens/user/forget_password.dart';
import 'package:smart_shop/screens/user/register_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark));
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Smart Shop',
        theme: ThemeData(
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          }),
          primaryColor: Color(0xffffffff),
          scaffoldBackgroundColor: Colors.white,
          canvasColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          cursorColor: Color.fromRGBO(50, 110, 253, 1.0),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LandingPage(),
          '/productdetails': (context) => ProductDetailsPage(),
          '/register': (context) => RegisterScreen(),
          '/forgetpassword': (context) => ForgotPassword(),
        });
  }
}
