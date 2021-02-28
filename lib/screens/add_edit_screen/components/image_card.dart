import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_wallet/constants/colors.dart';

class ImageCard extends StatelessWidget {
  ImageCard({Key key, this.getImage, this.backBtn, this.imageAddress})
      : super(key: key);
  final String imageAddress;
  final Function getImage;
  final Function backBtn;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: <Widget>[
          // SvgPicture.asset(
          //   imageAddress??'assets/images/undraw_Specs_djh3.svg',
          //   width: size.width,
          //   height: size.height * 0.4,
          //   fit: BoxFit.contain,
          // ),
          Container(
            width: size.width,
            height: size.height * 0.3,
            child: Container(
              margin: EdgeInsets.only(top: 30,bottom: 20,right: 30,left: 30),
              height: size.height * 0.3,
              width: size.width * 0.5,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: primaryColor,
                    offset: Offset(1,1),
                    spreadRadius: 10,
                    blurRadius: 30
                  ),
                ],
                shape: BoxShape.circle,
              ),
              child:SvgPicture.asset(imageAddress),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 90,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: getImage,
              child: Icon(
                Icons.camera,
                color: primaryColor,
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 10,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(-30, -30),
                    color: Colors.white,
                    blurRadius: 80,
                    spreadRadius: 10,
                  ),
                ],
              ),
              child: IconButton(
                color: Colors.black,
                iconSize: 30,
                icon: Icon(Icons.keyboard_backspace),
                onPressed: backBtn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
