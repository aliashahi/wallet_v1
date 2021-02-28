import 'package:flutter/material.dart';
import 'package:my_wallet/constants/colors.dart';

class InputField extends StatelessWidget {
  InputField(
      {Key key, this.onValueChange, this.placeHolder, this.textInputType})
      : super(key: key);
  final String placeHolder;
  final TextInputType textInputType;
  final Function onValueChange;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10,
        bottom: 0,
      ),
      height: 54,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 10
          )
        ]
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
              child: TextField(
                keyboardType: textInputType,
                onChanged: onValueChange,
                decoration: InputDecoration(
                  hintText: placeHolder.toUpperCase(),
                  hintStyle: TextStyle(
                    color: primaryColor,
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.all(15),
          //   child: Icon(Icons.search),
          // ),
        ],
      ),
    );
  }
}
