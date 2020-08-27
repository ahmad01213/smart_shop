import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:smart_shop/utils/styles.dart';

class GradiantButton extends StatelessWidget {
  final Function submitForm;
  String title;
  bool isLoading;
  GradiantButton({this.submitForm, this.isLoading, this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: double.infinity,
      child: RaisedButton(
        onPressed: () {
          submitForm();
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Style.primary,
                  Colors.white,
                ],
                begin: Alignment(0, 50),
                end: Alignment(18, -20),
              ),
              borderRadius: BorderRadius.circular(10.0)),
          child: Container(
            constraints:
                BoxConstraints(maxWidth: double.infinity, minHeight: 50.0),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(
                  width: 20,
                ),
                isLoading
                    ? Center(
                        child: SpinKitThreeBounce(
                          color: Colors.white,
                          size: 20,
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
