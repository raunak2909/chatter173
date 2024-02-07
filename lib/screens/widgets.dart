
import 'package:flutter/material.dart';

Widget myTextField ({
  required String hinttxt,
  Icon? preIcon, Icon? suffIcon,
   String? labelTxt,
  required TextEditingController mcrontroller,
  required String? Function(String? value) validator

}){
  return TextFormField(
    validator: validator,
    controller: mcrontroller,
    decoration: InputDecoration(
      label: Text(labelTxt!),
        prefixIcon: preIcon,
        suffixIcon: suffIcon,
        border: OutlineInputBorder(
        ),
        hintText: hinttxt,

    ),
  );
}
