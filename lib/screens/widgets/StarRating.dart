import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {

  final double totalAverage;
  final double size;
  final int totalCount;
  final bool forceStars;

  StarRating({Key key, this.totalAverage: 0.0, this.size: 16.0, this.totalCount, this.forceStars = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        if (!forceStars && (totalAverage==null || totalAverage==0))
          Text("New",),
        if (forceStars || (totalAverage!=null && totalAverage>0))
        ...List.generate(5, (index) =>
          Padding(
            padding: EdgeInsets.only(right: 1.0),
            child: Icon(
              (index+1) <= (totalAverage ?? 0) ? EvaIcons.star : EvaIcons.starOutline,
              size: size,
              color: (index+1) <= (totalAverage ?? 0) ? Color.fromRGBO(255, 186, 0, 1.0) : Theme.of(context).hintColor
            ),
          )
        ),
        if (totalCount!=null)
          SizedBox(width: 9.0),
        if (totalCount!=null)
          Text('khkh')
      ]
    );
  }
}