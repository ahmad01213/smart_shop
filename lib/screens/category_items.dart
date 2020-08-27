import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:smart_shop/utils/styles.dart';

import 'home_screen.dart';

class CategoryItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Text("  Fashion", style: Style.headStyle),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child:
                Icon(EvaIcons.arrowBack, size: 24.0, color: Colors.grey[600])),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          color: Style.primary.withOpacity(0.03),
          child: catItemsGride,
        ),
      ),
    );
  }

  Widget catItemsGride = GridView.count(
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
}
