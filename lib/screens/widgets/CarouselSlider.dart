import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class CarouselSlider extends StatelessWidget {
  const CarouselSlider({
    @required this.imagesUrlList,
    @required this.width,
    @required this.height,
    this.autoPlay = false,
    Key key,
  }) : super(key: key);

  final List imagesUrlList;
  final double height;
  final double width;
  final bool autoPlay;

  @override
  Widget build(BuildContext context) {
    return Carousel(
      boxFit: BoxFit.cover,
      autoplay: autoPlay,
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(milliseconds: 1000),
      dotSize: 6.0,
      dotIncreasedColor: Theme.of(context).primaryColor,
      dotBgColor: Colors.transparent,
      dotPosition: DotPosition.bottomCenter,
      dotVerticalPadding: 10.0,
      showIndicator: true,
      indicatorBgPadding: 7.0,
      images: imagesUrlList.map((image) {
        return Builder(builder: (BuildContext context) {
          return Container(
            child: Image.asset(image,
                width: width, height: height, fit: BoxFit.fill),
          );
        });
      }).toList(),
    );
  }
}
