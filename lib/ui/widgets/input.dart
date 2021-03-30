import 'package:flutter/material.dart';

Widget input(
    {double height,
    @required String text,
    TextEditingController controller,
    InputDecoration decoration,
    EdgeInsetsGeometry margin,
    EdgeInsetsGeometry contentPadding,
    double width,
    TextInputType keyboardType,
    ValueChanged<String> onChanged,
    bool obscureText,
    TextInputAction textInputAction,
    VoidCallback onEditingComplete}) {
  assert(text != null && text.isNotEmpty, 'Text can not be null or empty');
  return Padding(
    padding: margin ?? EdgeInsets.symmetric(vertical: 10),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(text,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xff8B8B8B))),
      SizedBox(height: 4),
      Container(
        height: height ?? 45,
        width: width ?? double.infinity,
        child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          onChanged: onChanged,
          obscureText: obscureText ?? false,
          onEditingComplete: onEditingComplete,
          textInputAction: textInputAction,
          decoration: decoration ??
              InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey, width: 2)),
                  hintText: text,
                  contentPadding: contentPadding ??
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10)),
        ),
      )
    ]),
  );
}
