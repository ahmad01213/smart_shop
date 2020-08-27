import 'package:flutter/material.dart';
import 'package:smart_shop/screens/PublicProductDetailsPage.dart';
import 'package:smart_shop/screens/category_items.dart';
import 'package:smart_shop/screens/widgets/AppbarGradient.dart';
import 'package:smart_shop/screens/widgets/CarouselSlider.dart';
import 'package:smart_shop/screens/widgets/HomeGridItemRecomended.dart';
import 'package:smart_shop/utils/styles.dart';

class HomeScreen extends StatelessWidget {
  int _currentPage = 0;
  final GlobalKey<ScaffoldState> scafoldKey;

  HomeScreen({this.scafoldKey});
  PageController _pageController = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Style.primary.withOpacity(0.03),
      child: Column(
        children: <Widget>[
          AppbarGradient(
            scafoldKey: scafoldKey,
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                height: 2200,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    buildSlider(context),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "New",
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    recentlyViewedList(context),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "By Category",
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    catList(context),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Best Sellers",
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    Expanded(
                      child: populars,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

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

  Widget populars = GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 17.0,
      childAspectRatio: 0.545,
      crossAxisCount: 2,
      primary: false,
      children: List.generate(
        gridItemArray.length,
        (index) => ItemGrid(gridItemArray[index]),
      ));
  Widget catList(ctx) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: catTexs.length,
          itemBuilder: (BuildContext context, int index) {
            return catItem(index, context);
          }),
    );
  }

  catItem(index, ctx) {
    return InkWell(
      onTap: () {
        Navigator.push(
          ctx,
          MaterialPageRoute(
            builder: (context) => CategoryItems(),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF656565).withOpacity(0.15),
                blurRadius: 4.0,
                spreadRadius: 1.0,
//           offset: Offset(4.0, 10.0)
              )
            ]),
        height: 150,
        width: 110,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              '${catTexs[index]['icon']}',
              color: catTexs[index]['color'],
              width: 50,
              height: 50,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              catTexs[index]['title'].toString(),
              style: TextStyle(color: catTexs[index]['color'], fontSize: 10.0),
              textAlign: TextAlign.left,
            )
          ],
        ),
      ),
    );
  }

  buildSlider(context) {
    return FractionallySizedBox(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width,
            child: CarouselSlider(
              imagesUrlList: images,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.35,
              autoPlay: true,
            ),
          ),
          Container(
            height: 15,
            width: double.infinity,
          ),
        ],
      ),
    );
  }

  buildListItem(int i) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 60,
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          border: Border.all(
            width: 0.5,
            color: Colors.grey,
          ),
        ),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQf83-cXyMjitfQzm0TO7YEE0XP3aWEHh8sxLWlqD-OxspWe55AXzFwEfUb50_oowCQ620boMcf5jHbwnQbThmjt-rmVTxJwlZluA&usqp=CAU&ec=45690273',
                height: 50,
                width: 50,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Seller Name',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}

class ItemGrid extends StatelessWidget {
  /// Get data from HomeGridItem.....dart class
  GridItem gridItem;
  ItemGrid(this.gridItem);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PublicProductDetailsPage(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF656565).withOpacity(0.1),
                blurRadius: 4.0,
                spreadRadius: 4.0,
//           offset: Offset(4.0, 10.0)
              )
            ]),
        child: Wrap(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                /// Set Animation image to detailProduk layout
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: mediaQueryData.size.height / 3.3,
                    width: 200.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(7.0),
                            topRight: Radius.circular(7.0)),
                        image: DecorationImage(
                            image: AssetImage(gridItem.img),
                            fit: BoxFit.contain)),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 7.0)),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Text(
                    gridItem.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        letterSpacing: 0.5,
                        color: Colors.black54,
                        fontFamily: "Sans",
                        fontWeight: FontWeight.w500,
                        fontSize: 13.0),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 1.0)),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Text(
                    gridItem.price,
                    style: TextStyle(
                        fontFamily: "Sans",
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            gridItem.rattingValue,
                            style: TextStyle(
                                fontFamily: "Sans",
                                color: Colors.black26,
                                fontWeight: FontWeight.w500,
                                fontSize: 12.0),
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 14.0,
                          )
                        ],
                      ),
                      Text(
                        gridItem.itemSale,
                        style: TextStyle(
                            fontFamily: "Sans",
                            color: Colors.black26,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.0),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

List catIcons = [
  'assets/concrete.png',
  'assets/break.png',
  'assets/blocks.png',
];
List catTexs = [
  {'title': 'Men', 'icon': 'assets/img/men.png', 'color': Colors.blue},
  {'title': 'Women', 'icon': 'assets/img/women.png', 'color': Colors.pink},
  {
    'title': 'Fashion',
    'icon': 'assets/img/fashion.png',
    'color': Colors.deepPurple
  },
  {
    'title': 'Phones',
    'icon': 'assets/img/phone.png',
    'color': Color(0xFF44bd32)
  },
  {'title': 'Cmera', 'icon': 'assets/img/camera.png', 'color': Colors.black},
  {
    'title': 'Health Car',
    'icon': 'assets/img/health_care.png',
    'color': Colors.lightGreen
  },
  {
    'title': 'Computer',
    'icon': 'assets/img/laptop.png',
    'color': Color(0xFF192a56)
  },
];

final slides = [
  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRdMCTwRAVopqy4jaUpizwAXphKvdldiM_37MTU0X_NJzCrfbYu&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT5tSGYuRtE6VWuW9h2ntiPs6PNjIs1_aDNilMXmceAx-f8-V9h&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQoTTdtBUrLPRw5SdLeRsyUZR9sw1VaUMGG3CUxKb_mgiILFzEK&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQuY0YcMXgbNhgmqHM1Jro1-k6oFAid6ysYc94CHopdRNa7gDkT&usqp=CAU'
];

List<GridItem> gridItemArray = [
  GridItem(
    id: "1",
    img: "assets/images/p1.jpg",
    title: "iPhone SE (2nd Generation)",
    price: "\$ 140",
    itemSale: "132 Sale",
    rattingValue: "4.1",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen.....",
  ),
  GridItem(
    id: "3",
    img: "assets/images/p2.jpg",
    title: "ZedNote II Convertible 2-In-1 ",
    price: "\$ 200",
    itemSale: "122 Sale",
    rattingValue: "5",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen.....",
  ),
  GridItem(
    id: "4",
    img: "assets/images/p3.jpg",
    title: " Long Sleeve T-Shirt Pink",
    price: "\$ 30",
    itemSale: "53 Sale",
    rattingValue: "4.5",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen.....",
  ),
  GridItem(
    id: "5",
    img: "assets/images/p4.jpg",
    title: "Self Tie Shirt Midi Dress White",
    price: "\$ 20",
    itemSale: "130 Sale",
    rattingValue: "4.5",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen.....",
  ),
  GridItem(
    id: "2",
    img: "assets/images/p5.jpg",
    title: "Veronav Racing Style Gaming Chair",
    price: "\$ 220",
    itemSale: "82 Sale",
    rattingValue: "4.0",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen.....",
  ),
  GridItem(
    id: "4",
    img: "assets/images/p2.jpg",
    title: " Long Sleeve T-Shirt Pink",
    price: "\$ 30",
    itemSale: "53 Sale",
    rattingValue: "4.5",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen.....",
  ),
];
