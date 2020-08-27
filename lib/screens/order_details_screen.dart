import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:smart_shop/screens/home_screen.dart';
import 'package:smart_shop/screens/widgets/CarouselSlider.dart';
import 'package:smart_shop/screens/widgets/LargeAvatar.dart';
import 'package:smart_shop/screens/widgets/SecondaryButton.dart';
import 'package:smart_shop/screens/widgets/StarRating.dart';

class ProductDetailsPage extends StatefulWidget {
  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Center(
            child: FractionallySizedBox(
              child: Column(children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                FractionallySizedBox(
                  child: Stack(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.45,
                        width: MediaQuery.of(context).size.width,
                        child: CarouselSlider(
                          imagesUrlList: gridItemArray
                              .map((e) => () {
                                    return e.img;
                                  })
                              .toList(),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.45,
                          autoPlay: true,
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          height: 20,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: CircleAvatar(
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    child: Icon(
                                      EvaIcons.closeOutline,
                                      color: Colors.white,
                                      size: 20,
                                    )),
                              ),
                              InkWell(
                                onTap: () {},
                                child: CircleAvatar(
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    child: Icon(
                                      EvaIcons.editOutline,
                                      color: Colors.white,
                                      size: 20,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                FractionallySizedBox(
                  widthFactor: 0.85,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "\$44",
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "title",
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "kfdshfsdghsgksjdfghjfjds",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(color: Theme.of(context).dividerColor),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            LargeAvatar(),
                            SizedBox(
                              width: 7,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Elham Rababah"),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                StarRating(totalAverage: 4.3, forceStars: true),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(color: Theme.of(context).dividerColor),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: SecondaryButton(
                                title: " Mark as Sold",
                                color: Color(0xFF6B4421),
                                textColor: Colors.white,
                                onTap: () async {}),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
