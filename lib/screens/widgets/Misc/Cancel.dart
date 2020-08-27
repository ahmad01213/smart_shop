import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class Cancel extends StatelessWidget {
  const Cancel({
    Key key,
    this.text = "Cancel",
  }) : super(key: key);

  final text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(height: 24.0),
        InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white70,
              ),
              child: Icon(
                EvaIcons.close,
                color: Colors.black,
                size: 25,
              )),
        ),
        SizedBox(height: 40.0),
      ],
    );
  }
}
