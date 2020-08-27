import 'package:flutter/material.dart';
import 'package:smart_shop/utils/styles.dart';

class AppbarGradient extends StatefulWidget {
  final GlobalKey<ScaffoldState> scafoldKey;

  AppbarGradient({this.scafoldKey});
  @override
  _AppbarGradientState createState() => _AppbarGradientState();
}

class _AppbarGradientState extends State<AppbarGradient> {
  /// Build Appbar in layout home
  @override
  Widget build(BuildContext context) {
    /// Create responsive height and padding
    final MediaQueryData media = MediaQuery.of(context);
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    /// Create component in appbar
    return Container(
      padding: EdgeInsets.only(top: statusBarHeight),
      height: 58.0 + statusBarHeight,
      decoration: BoxDecoration(

          /// gradient in appbar
          gradient: LinearGradient(
              colors: [
                Colors.deepOrangeAccent,
                Style.primary,
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          InkWell(
              onTap: () {
                widget.scafoldKey.currentState.openDrawer();
              },
              child: Icon(
                Icons.menu,
                size: 35,
                color: Colors.white,
              )),

          /// if user click shape white in appbar navigate to search layout
          InkWell(
            onTap: () {},

            /// Create shape background white in appbar (background treva shop text)
            child: Container(
              margin: EdgeInsets.only(left: media.padding.left + 5),
              height: 37.0,
              width: 222.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  shape: BoxShape.rectangle),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 17.0)),
                  Icon(
                    Icons.search,
                    color: Colors.black12,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Text(
                      'Search ...',
                      style: TextStyle(
                          fontFamily: "Popins",
                          color: Colors.black12,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0.0,
                          fontSize: 16.4),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// Icon chat (if user click navigate to chat layout)
          InkWell(
              onTap: () {},
              child: Image.asset(
                "assets/img/chat.png",
                height: media.devicePixelRatio + 20.0,
              )),

          /// Icon notification (if user click navigate to notification layout)
          InkWell(
            onTap: () {},
            child: Stack(
              alignment: AlignmentDirectional(-3.0, -3.0),
              children: <Widget>[
                Image.asset(
                  "assets/img/notifications-button.png",
                  height: 24.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
