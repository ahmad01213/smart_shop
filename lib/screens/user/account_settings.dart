import 'package:flutter/material.dart';
import 'package:smart_shop/screens/user/login.dart';
import 'package:smart_shop/utils/styles.dart';

class AccountSettings extends StatefulWidget {
  final Function notifyParent;
  AccountSettings({this.notifyParent});
  @override
  _AccountSettingsState createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  @override
  Widget build(BuildContext context) {
    return LoginScreen();
  }

  Future<void> signOut() async {
    widget.notifyParent();
  }
}
