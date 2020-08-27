import 'package:flutter/material.dart';
import 'package:smart_shop/utils/styles.dart';

class FormInput extends StatelessWidget {
  final String placeholder;
  final TextInputType keyboardType;
  final FormFieldValidator validator;
  final TextEditingController tec;
  FormInput({
    this.placeholder,
    this.keyboardType,
    this.validator,
    this.tec,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: TextStyle(
          fontSize: 15.0,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Style.primary,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Style.grayDegree,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 15.0,
            color: Colors.black26,
          ),
        ),
        maxLines: 1,
        controller: tec,
        validator: validator,
        keyboardType: keyboardType,
        obscureText:
            keyboardType == TextInputType.visiblePassword ? true : false);
  }
}
