import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return LoginScreen(notifyParent: updateState);
  }

  updateState() {
    setState(() {});
  }
}
