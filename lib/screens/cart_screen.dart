import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_shop/screens/widgets/box30.dart';
import 'package:smart_shop/screens/widgets/gradiant_button.dart';
import 'package:smart_shop/utils/styles.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
            margin: EdgeInsets.all(30),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Text("Cart",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    )),
                Divider(
                  thickness: 1,
                ),
                Container(
                  height: 180.0,
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12.withOpacity(0.1),
                        blurRadius: 3.5,
                        spreadRadius: 0.4,
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.all(10.0),

                              /// Image item
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.1),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.black12.withOpacity(0.1),
                                            blurRadius: 0.5,
                                            spreadRadius: 0.1)
                                      ]),
                                  child: Image.network(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR3tv4BG3m3PDzRZpQA-qSWqNS9KQTvF-uIfXZUDnagLNY_veODJs-zz9VfDBGFiTG5q5dlvdUR0J2pFs9FejemiTr6A3fzQlSNbA&usqp=CAU&ec=45690273',
                                    height: 130.0,
                                    width: 120.0,
                                    fit: BoxFit.cover,
                                  ))),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 25.0, left: 10.0, right: 5.0),
                              child: Column(
                                /// Text Information Item
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'iphone 8 pro 2 camera heigh resoulution',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Sans",
                                      color: Colors.black87,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 10.0)),
                                  Text(
                                    '2 GB Ram',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 10.0)),
                                  Text('\$830'),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 18.0, left: 0.0),
                                    child: Container(
                                      width: 112.0,
                                      decoration: BoxDecoration(
                                          color: Colors.white70,
                                          border: Border.all(
                                              color: Colors.black12
                                                  .withOpacity(0.1))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          /// Decrease of value item
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              height: 30.0,
                                              width: 30.0,
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      right: BorderSide(
                                                          color: Colors.black12
                                                              .withOpacity(
                                                                  0.1)))),
                                              child: Center(child: Text("-")),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 18.0),
                                            child: Text('3'),
                                          ),

                                          /// Increasing value of item
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              height: 30.0,
                                              width: 28.0,
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      left: BorderSide(
                                                          color: Colors.black12
                                                              .withOpacity(
                                                                  0.1)))),
                                              child: Center(child: Text("+")),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 8.0)),
                    ],
                  ),
                ),
                Container(
                  height: 180.0,
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12.withOpacity(0.1),
                        blurRadius: 3.5,
                        spreadRadius: 0.4,
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.all(10.0),

                              /// Image item
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.1),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.black12.withOpacity(0.1),
                                            blurRadius: 0.5,
                                            spreadRadius: 0.1)
                                      ]),
                                  child: Image.network(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR3tv4BG3m3PDzRZpQA-qSWqNS9KQTvF-uIfXZUDnagLNY_veODJs-zz9VfDBGFiTG5q5dlvdUR0J2pFs9FejemiTr6A3fzQlSNbA&usqp=CAU&ec=45690273',
                                    height: 130.0,
                                    width: 120.0,
                                    fit: BoxFit.cover,
                                  ))),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 25.0, left: 10.0, right: 5.0),
                              child: Column(
                                /// Text Information Item
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'iphone 8 pro 2 camera heigh resoulution',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Sans",
                                      color: Colors.black87,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 10.0)),
                                  Text(
                                    '2 GB Ram',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 10.0)),
                                  Text('\$830'),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 18.0, left: 0.0),
                                    child: Container(
                                      width: 112.0,
                                      decoration: BoxDecoration(
                                          color: Colors.white70,
                                          border: Border.all(
                                              color: Colors.black12
                                                  .withOpacity(0.1))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          /// Decrease of value item
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              height: 30.0,
                                              width: 30.0,
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      right: BorderSide(
                                                          color: Colors.black12
                                                              .withOpacity(
                                                                  0.1)))),
                                              child: Center(child: Text("-")),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 18.0),
                                            child: Text('3'),
                                          ),

                                          /// Increasing value of item
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              height: 30.0,
                                              width: 28.0,
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      left: BorderSide(
                                                          color: Colors.black12
                                                              .withOpacity(
                                                                  0.1)))),
                                              child: Center(child: Text("+")),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 8.0)),
                    ],
                  ),
                ),
                Container(
                  height: 70,
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 20),
                  color: Colors.black12,
                  child: Center(
                    child: Text(
                      'Total : \$2490',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Box30(),
                GradiantButton(
                  isLoading: false,
                  submitForm: () {},
                  title: 'Confirm Order',
                ),
              ],
            )));
  }
}
