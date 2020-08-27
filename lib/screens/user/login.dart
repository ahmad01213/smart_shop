import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_shop/screens/widgets/box30.dart';
import 'package:smart_shop/screens/widgets/gradiant_button.dart';
import 'package:smart_shop/screens/widgets/input.dart';
import 'package:smart_shop/utils/styles.dart';

class LoginScreen extends StatefulWidget {
  final Function notifyParent;
  LoginScreen({this.notifyParent});
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();
  TextEditingController tecEmail = TextEditingController();
  TextEditingController tecPassword = TextEditingController();
  bool isLogin = true;
  String error = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Text("Profile",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                )),
            Divider(
              thickness: 1,
            ),
            Box30(),
            Center(
              child: Image.asset(
                'assets/img/Logo.jpg',
                height: 100,
                width: 100,
                fit: BoxFit.fill,
              ),
            ),
            Box30(),
            Align(
              alignment: Alignment.topLeft,
              child: Text("Login",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Sign in to see your Profile',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black26,
                ),
              ),
            ),
            Box30(),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  FormInput(
                    placeholder: 'Your Email',
                    validator: (value) {
                      if (value.isEmpty)
                        return "Please enter your Email";
                      else if (!value.contains("@") ||
                          error == "ERROR_INVALID_EMAIL")
                        return "Please enter a valid Email.";
                      else if (error == "ERROR_USER_NOT_FOUND")
                        return "User doesn't exist. Try again.";
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    tec: tecEmail,
                  ),
                  Box30(),
                  FormInput(
                    placeholder: 'Your Password',
                    validator: (value) {
                      if (value.isEmpty)
                        return 'Please enter your Password.';
                      else if (error == "ERROR_WRONG_PASSWORD")
                        return "Password entered is incorrect.";
                      return null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    tec: tecPassword,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/forgetpassword');
                      },
                      child: Text("Forget Password?",
                          style: TextStyle(
                              color: Style.primaryColor,
                              fontSize: 14.0,
                              decoration: TextDecoration.underline)),
                    ),
                  ),
                  Box30(),
                  GradiantButton(
                    isLoading: _isLoading,
                    submitForm: submitForm,
                    title: 'Sign In',
                  ),
                  Box30(),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("/register");
                    },
                    child: Text("Create an account",
                        style: TextStyle(
                            color: Style.grayDegree,
                            fontSize: 17.0,
                            decoration: TextDecoration.underline)),
                  ),
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      Container(
//                        child: InkWell(
//                          onTap: () {},
//                          child: CircleAvatar(
//                              backgroundColor: Colors.white,
//                              child: Image.asset("assets/img/Image 2.png",
//                                  fit: BoxFit.cover)),
//                        ),
//                      ),
//                      SizedBox(width: 20.0),
//                      InkWell(
//                        onTap: () {},
//                        child: Container(
//                          child: CircleAvatar(
//                              backgroundColor: Color.fromRGBO(83, 125, 192, 1),
//                              child: Image.asset(
//                                "assets/img/Image 3.png",
//                                scale: 1.5,
//                              )),
//                        ),
//                      ),
//                    ],
//                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool submitForm() {}

  @override
  void initState() {
    super.initState();
  }
}
