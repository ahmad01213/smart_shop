import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_shop/screens/widgets/CarouselSlider.dart';
import 'package:smart_shop/screens/widgets/CustomBottomSheet.dart';
import 'package:smart_shop/screens/widgets/Misc/Cancel.dart';
import 'package:smart_shop/screens/widgets/SecondaryButton.dart';
import 'package:smart_shop/screens/widgets/Text.dart';
import 'package:smart_shop/utils/styles.dart';

class PublicProductDetailsPage extends StatefulWidget {
  @override
  _PublicProductDetailsPageState createState() =>
      _PublicProductDetailsPageState();
}

class _PublicProductDetailsPageState extends State<PublicProductDetailsPage> {
  bool _isLoading = false;
  bool _isFavorite = false;
  int quantity = 1;
  bool _isShowBottomSheet = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: InkWell(
          onTap: () {
            if (_isShowBottomSheet) {
              setState(() {
                _isShowBottomSheet = false;
              });
            }
          },
          child: Container(
            color: Style.primary.withOpacity(0.03),
            height: double.infinity,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Center(
                child: FractionallySizedBox(
                  child: Column(children: <Widget>[
                    Stack(
                      children: <Widget>[
                        FractionallySizedBox(
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.35,
                                width: MediaQuery.of(context).size.width,
                                child: CarouselSlider(
                                  imagesUrlList: images,
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.35,
                                  autoPlay: false,
                                ),
                              ),
                              Container(
                                height: 15,
                                width: double.infinity,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 20,
                          left: 25,
                          child: Cancel(
                            text: "Back",
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          right: 25,
                          child: InkWell(
                            onTap: () {
                              //TODO Add to favorite
                              setState(() {
                                _isFavorite = !_isFavorite;
                              });
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Center(
                                child: Icon(
                                  _isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: _isFavorite ? Colors.red : Colors.grey,
                                ),
                                widthFactor: 0.6,
                                heightFactor: 0.6,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 15,
                          right: 25,
                          child: InkWell(
                            onTap: () {
                              //TODO
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              child: Center(
                                child: Icon(
                                  FontAwesomeIcons.lock,
                                  color: Style.primary,
                                  size: 15,
                                ),
                                widthFactor: 0.6,
                                heightFactor: 0.6,
                              ),
                            ),
                          ),
                        )
                      ],
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
                          Texts(
                            "\$77",
                            bold: true,
                            variant: 'heading2',
                            color: Colors.green,
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Texts(
                            "ZedNote II Convertible 2-In-1",
                            regular: true,
                            variant: 'bodyText',
                            color: Style.primary,
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Texts(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen.",
                            regular: true,
                            variant: 'bodyText',
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                  flex: 2,
                                  child: Texts(
                                    'Shipping',
                                    fontWeight: FontWeight.w300,
                                  )),
                              Expanded(flex: 3, child: Texts('Good')),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                  flex: 2,
                                  child: Texts(
                                    'Condition',
                                    fontWeight: FontWeight.w300,
                                  )),
                              Expanded(flex: 3, child: Texts('New')),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                  flex: 2,
                                  child: Texts(
                                    'Category',
                                    fontWeight: FontWeight.w300,
                                  )),
                              Expanded(flex: 3, child: Texts('Category')),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: SecondaryButton(
                                    title: 'Add to Cart',
                                    color: Style.primary,
                                    textColor: Colors.white,
                                    loading: _isLoading,
                                    disabled: _isLoading,
                                    onTap: showBottomSheet),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 45,
                    ),
                  ]),
                ),
              ),
            ),
          ),
        ),
        bottomSheet: CustomBottomSheet(
          children: <Widget>[
            _isShowBottomSheet
                ? Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 20, top: 10),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.grey, width: 2.0),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.green,
                                    size: 22,
                                  ),
                                  widthFactor: 0.6,
                                  heightFactor: 0.6,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Texts('Added to Cart')
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(left: 20, bottom: 20, right: 20),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 50,
                                height: 50,
                                decoration:
                                    BoxDecoration(shape: BoxShape.rectangle),
                                child: Image.network(
                                  images[0],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child:
                                      Texts('ZedNote II Convertible 2-In-1')),
                              Texts(
                                'US \$ 77',
                                color: Colors.green,
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: SecondaryButton(
                                title: 'Go To Bag',
                                color: Style.primary,
                                textColor: Colors.white,
                                onTap: () {
                                  //BagPage
                                }),
                          ),
                        )
                      ],
                    ),
                  )
                : Container(),
          ],
        ));
  }

  showBottomSheet() {
    setState(() {
      _isShowBottomSheet = true;
    });
  }

  String getCategory(List<String> categories) {
    String category = "";
    if (categories.length > 1) {
      for (int index = 0; index <= categories.length - 2; index++) {
        category = category + categories[index] + ' & ';
      }
      category = category + categories[categories.length - 1];
    } else
      category = categories[0];

    return category;
  }
}

List images = [
  'assets/images/slid1.jpg',
  'assets/images/slid2.jpg',
  'assets/images/slid3.jpg',
  'assets/images/slid4.JPG',
];
