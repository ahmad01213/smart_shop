import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_shop/screens/widgets/gradiant_button.dart';
import 'package:smart_shop/screens/widgets/input.dart';
import 'package:smart_shop/utils/styles.dart';

class ForgotPassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final formKey = GlobalKey<FormState>();
  TextEditingController tecEmail = TextEditingController();

  String _email;
  bool _isLoading = false;
  String error = "";

  @override
  void initState() {
    super.initState();
  }

  bool _validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          automaticallyImplyLeading: false,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(EvaIcons.arrowBack,
                  size: 24.0, color: Colors.grey[600])),
        ),
        body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Center(
                child: FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: <Widget>[
                          Text("Reset Password", style: Style.headStyle),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Enter your email address and we will email you a link to reset your password.",
                        style: Style.contentStyle
                            .copyWith(color: Colors.grey[600]),
                      ),
                      SizedBox(height: 48.0),
                      FormInput(
                        placeholder: "Email Address",
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
                        tec: tecEmail,
                      ),
                      SizedBox(height: 24.0),
                      GradiantButton(
                        isLoading: _isLoading,
                        submitForm: () {},
                        title: 'Send',
                      ),
                      SizedBox(height: 24.0),
                      FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Return to Login",
                            textAlign: TextAlign.justify,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[500]),
                          )), //
                      SizedBox(height: 24.0)
                    ],
                  ),
                ),
              ),
            )));
  }
}
