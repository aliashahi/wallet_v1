import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_wallet/constants/colors.dart';
import 'package:my_wallet/services/object_handler.dart';

onDeleteSub(BuildContext context, Case element, InOutCome sub) {
  int amount = 0;
  Size size = MediaQuery.of(context).size;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: Container(
          height: size.height * 0.17,
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
                        'Are you Sure??',
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
                  ],
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
                        final caseHandler = CaseHandler();
                        caseHandler.removeSub(element, sub);
                        Navigator.of(context).pop();
                      },
                      color: primaryColor.withOpacity(0.7),
                      child: Text(
                        'Delete',
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
