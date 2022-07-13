import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class getTextFormField extends StatelessWidget {
  TextEditingController? controller;
  String? hintName;
  String? labelName;
  IconData? icon;
  bool isObscureText = false;
  TextInputType inputType;
  bool _passwordVisible = false;

  getTextFormField(
      {this.controller,
      this.hintName,
      this.labelName,
      this.icon,
      this.inputType = TextInputType.text,
      this.isObscureText = false});
  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Container(
      padding: const EdgeInsets.only(top: 25, left: 50, right: 50),
      child: TextFormField(
        controller: controller,
        obscureText: isObscureText,
        keyboardType: inputType,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $hintName';
          }
          return null;
        },
        // onSaved: (value) {
        //   this.controller?.text = value;
        // },
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide(color: Colors.transparent)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide(color: Colors.blue)),
            errorStyle: TextStyle(color: Colors.red),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide(color: Colors.blue)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide(color: Colors.red)),
            prefixIcon: Icon(icon),
            labelText: labelName,
            hintText: hintName,
            contentPadding: const EdgeInsets.only(left: 20),
            fillColor: Colors.grey[200],
            filled: true),
      ),
    );
  }
}
