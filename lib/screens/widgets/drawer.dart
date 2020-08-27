import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_shop/utils/styles.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Style.primary,
      child: Drawer(
        child: sideMenuContent(),
      ),
    );
  }

  Widget sideMenuContent() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSjQHPzq_eApOhi-nBJtMD-bscOpY1-AvZk870Bd3jMUY7hZeTfRC8QVSNcEEs04M7Bdax5uwx98lwLM4K7jdHdFIJaBa_50lQBmw&usqp=CAU&ec=45690273',
                height: 50,
                width: 50,
                fit: BoxFit.fill,
              ),
              SizedBox(
                width: 20,
              ),
              Center(
                child: Text(
                  'Smart Shop',
                  style: TextStyle(
                      color: Colors.yellowAccent,
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Divider(
            color: Colors.white,
          ),
          Flexible(
            child: ListView.builder(
              itemBuilder: (ctx, i) {
                return categoryMenuItem(i, ctx);
              },
              itemCount: menuData.length,
              physics: BouncingScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }

  Widget categoryMenuItem(i, context) {
    return Container(
      margin: EdgeInsets.only(bottom: 40),
      child: Text(
        menuData[i]['name'],
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
            fontSize: 17),
      ),
    );
  }

  List menuData = [
    {
      'name': 'advertising',
    },
    {'name': 'Clocks and TimePieces'},
    {
      'name': 'ArtWork',
    },
    {
      'name': 'Books',
    },
    {
      'name': 'Furniture',
    },
    {
      'name': 'Industerial',
    },
    {
      'name': 'Lighting',
    },
    {
      'name': 'Rugs',
    },
    {
      'name': 'Sientific',
    },
    {
      'name': 'Pottery',
    },
    {
      'name': 'Ventage Clothing',
    },
    {
      'name': 'GlassWare',
    },
  ];
}
