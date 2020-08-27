import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_shop/screens/widgets/gradiant_button.dart';
import 'package:smart_shop/screens/widgets/input.dart';
import 'package:smart_shop/utils/styles.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isloading = false;
  TextEditingController tecName = TextEditingController();
  TextEditingController tecEmail = TextEditingController();
  TextEditingController tecPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Text("Create an Account",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  )),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Image.asset(
                  'assets/img/Logo.jpg',
                  height: 100,
                  width: 100,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text("SignUp",
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
              SizedBox(
                height: 30,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    FormInput(
                      placeholder: 'Your Name',
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please type your name';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      tec: tecName,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    FormInput(
                      placeholder: 'Your Email',
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please type your email';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      tec: tecEmail,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    FormInput(
                      placeholder: 'Your Password',
                      validator: (value) {
                        if (value.isEmpty || value.length < 6) {
                          return 'Please type a password  with length 6 at least ';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      tec: tecPassword,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GradiantButton(
                      isLoading: _isloading,
                      submitForm: () {},
                      title: 'Sign Up',
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Back to Login",
                          style: TextStyle(
                              color: Style.grayDegree,
                              fontSize: 17.0,
                              decoration: TextDecoration.underline)),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
