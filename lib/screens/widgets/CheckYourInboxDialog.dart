import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:smart_shop/utils/styles.dart';

Future<void> showSentDialog(
    BuildContext context, String _email, String message) async {
  await showGeneralDialog(
    context: context,
    barrierColor: Color.fromRGBO(255, 255, 255, 1),
    barrierDismissible: true,
    barrierLabel: "Email has been sent!",
    transitionDuration: Duration(milliseconds: 0),
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          automaticallyImplyLeading: false,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(EvaIcons.close, size: 24.0, color: Colors.grey[600])),
        ),
        body: Material(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: FractionallySizedBox(
                widthFactor: 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 80.0),
                    Image.asset("assets/img/sent.png"),
                    Text(
                      "Check your Inbox",
                      style: Style.headStyle,
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      message,
                      style: Style.titleStyle,
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      _email,
                      style: Style.contentStyle.copyWith(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
