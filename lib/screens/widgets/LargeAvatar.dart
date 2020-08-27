import 'package:flutter/material.dart';

import 'AvatarGradients.dart';

class LargeAvatar extends StatelessWidget {
  Widget _getAvatar() {
    return Center(
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(60.0)),
            child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTcI0ram-FnLI5Vqm3FB5eoZcNQM7UYixdS-WaXhuJpCVIbm6ubC2RqEbNYSxZW-M7eU9SrX_JPcHKy_M8ERFlHP46Alft4EyWsTg&usqp=CAU&ec=45690273',
              fit: BoxFit.cover,
              width: 90.0,
              height: 90.0,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment(-1, -1),
                end: Alignment(1, 1),
                colors: AvatarGradients.getGradients('kshfkjgdsjkg')),
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.08),
                  offset: Offset(0.0, 5.0),
                  blurRadius: 16.0)
            ],
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
            border:
                Border.all(color: Theme.of(context).backgroundColor, width: 1)),
        width: 90.0,
        height: 90.0,
        child: _getAvatar());
  }
}
