import 'package:smart_shop/screens/cart_screen.dart';
import 'package:smart_shop/screens/home_screen.dart';
import 'package:smart_shop/screens/search_screen.dart';
import 'package:smart_shop/screens/user/account_settings.dart';
import 'package:smart_shop/screens/widgets/drawer.dart';
import 'package:smart_shop/utils/styles.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LandingPage extends StatefulWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  PageController pageController = new PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: widget._scaffoldKey,
      body: Container(
        color: Style.primary.withOpacity(0.03),
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          children: <Widget>[
            HomeScreen(
              scafoldKey: widget._scaffoldKey,
            ),
            SearChScreen(),
            CartScreen(),
            AccountSettings()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: currentTab,
          onTap: _changeIndex,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: IconThemeData(color: Style.primary),
          unselectedIconTheme: IconThemeData(color: Colors.black45),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(EvaIcons.home),
              activeIcon: Icon(EvaIcons.home),
              title: Text('home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.search),
              title: Text('search'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                EvaIcons.shoppingBag,
                size: 30,
              ),
              activeIcon: Icon(
                EvaIcons.shoppingBag,
                size: 30,
              ),
              title: Text('Category'),
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.user),
              activeIcon: Icon(FontAwesomeIcons.user),
              title: Text('profile'),
            )
          ]),
      drawer: DrawerMenu(),
    );
  }

  int currentTab = 0;
  void _changeIndex(int index) {
    setState(() {
      currentTab = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  void initState() {
    super.initState();
  }
}
