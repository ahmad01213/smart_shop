import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_shop/screens/PublicProductDetailsPage.dart';
import 'package:smart_shop/screens/home_screen.dart';
import 'package:smart_shop/utils/styles.dart';

class SearChScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        color: Style.primary.withOpacity(0.03),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            _search,
            Padding(
              padding: const EdgeInsets.only(
                  top: 100.0, left: 30, right: 30, bottom: 100),
              child: Text(
                'Hello , Search For any product on Smart Shop',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                'Popular',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Style.primary,
                    fontSize: 16),
              ),
            ),
            recentlyViewedList(context),
          ],
        ),
      ),
    );
  }

  var _search = Padding(
    padding: const EdgeInsets.only(top: 35.0, right: 20.0, left: 20.0),
    child: Container(
      height: 50.0,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 15.0,
                spreadRadius: 0.0)
          ]),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 10.0),
          child: Theme(
            data: ThemeData(hintColor: Colors.transparent),
            child: TextFormField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.search,
                    color: Style.primary,
                    size: 28.0,
                  ),
                  hintText: 'Search Any',
                  hintStyle: TextStyle(
                      color: Colors.black54,
                      fontFamily: "Gotik",
                      fontWeight: FontWeight.w400)),
            ),
          ),
        ),
      ),
    ),
  );

  Widget recentlyViewedList(ctx) {
    return SizedBox(
      height: 290,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: gridItemArray.length,
        itemBuilder: (ctx, i) => recentlyViewedItem(ctx, i),
      ),
    );
  }

  Widget recentlyViewedItem(ctx, i) {
    return InkWell(
      onTap: () {
        Navigator.push(
          ctx,
          MaterialPageRoute(
            builder: (context) => PublicProductDetailsPage(),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.fromLTRB(5, 0, 10, 0),
          height: 270,
          width: 160,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                gridItemArray[i].img,
                height: 170,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                gridItemArray[i].title,
                style: TextStyle(color: Colors.black, fontSize: 12.0),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "\$${gridItemArray[i].price}",
                    style: TextStyle(color: Colors.black38, fontSize: 14.0),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "${gridItemArray[i].rattingValue} ★",
                    style: TextStyle(color: Colors.orange, fontSize: 15.0),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Fendi Fashion",
                style: TextStyle(color: Colors.black45, fontSize: 10.0),
                textAlign: TextAlign.left,
              )
            ],
          ),
        ),
      ),
    );
  }
}
