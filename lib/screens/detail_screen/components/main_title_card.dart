import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_wallet/constants/colors.dart';
import 'package:my_wallet/services/object_handler.dart';

class MainTitleCard extends StatelessWidget {
  final Case element;
  MainTitleCard({Key key, this.element});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 0),
                spreadRadius: 10,
                blurRadius: 10,
                color: secondaryColor.withOpacity(0.1),
              ),
            ]),
        margin: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: element.title+'\n',
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      TextSpan(
                        text: element.inOutComes.length.toString()+' record until Today!\n',
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextSpan(
                        text: element.lastModifiedTime+'\n',
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 20,
                ),
                child: Stack(
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      margin: EdgeInsets.symmetric(vertical: 30, horizontal: 0),
                      child: CircularProgressIndicator(
                        backgroundColor:
                            element.isIncome ? secondaryColor : accentColor,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white54),
                        value: 1 - element.fullAmount / 100000,
                        strokeWidth: 10,
                      ),
                    ),
                    Positioned(
                      bottom: 80,
                      left: 10,
                      right: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            element.fullAmount.toString() + ' \$',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
