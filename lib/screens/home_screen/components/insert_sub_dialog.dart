import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_wallet/constants/colors.dart';
import 'package:my_wallet/screens/home_screen/home_screen.dart';
import 'package:my_wallet/services/object_handler.dart';
import 'package:uuid/uuid.dart';

onInsertSub(BuildContext context, Case element) {
  int amount = 0;
  Size size = MediaQuery.of(context).size;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.red,
        child: Container(
          height: size.height * 0.3,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Total Amount:',
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 23,
                            fontWeight: FontWeight.w600,
                            shadows: [
                              BoxShadow(
                                offset: Offset(1, 1),
                              )
                            ]),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        element.fullAmount.toString() + ' \$',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w300,
                          color: primaryColor.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: primaryColor,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      amount = int.tryParse(value);
                    },
                    decoration: InputDecoration(
                      hintText: 'enter the amount',
                      hintStyle: TextStyle(
                        color: primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                  bottom: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      color: Colors.red.withOpacity(0.7),
                      child: Text(
                        'close',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        if (amount != null && amount != 0) {
                          final caseHandler = CaseHandler();
                          caseHandler.saveSub(element, amount);
                        }
                        Navigator.of(context).pop();
                      },
                      color: primaryColor.withOpacity(0.7),
                      child: Text(
                        'add',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
