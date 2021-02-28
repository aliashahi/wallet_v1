import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_wallet/constants/colors.dart';
import 'package:my_wallet/services/object_handler.dart';

class InOutComeCard extends StatelessWidget {
  InOutComeCard({Key key, this.element, this.onDeletePressed, this.imageAddress}) : super(key: key);
  final InOutCome element;
  final String imageAddress;
  final Function onDeletePressed;

  addSubDialog(BuildContext context, Case element) {}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 70,
            spreadRadius: 8,
            color: Colors.black.withOpacity(0.2),
          ),
        ],
      ),
      height: size.height * 0.1,
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              leading: CircleAvatar(
                child: SvgPicture.asset(
                  'assets/images/Working.svg',
                ),
                backgroundColor: Colors.white,
              ),
              title: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: (element.isIncome ? '+ ' : '- ') +
                        element.amount.toString() +
                        ' \$\n',
                    style: TextStyle(
                      color: primaryColor.withOpacity(0.8),
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  TextSpan(
                    text: element.lastModifiedTime,
                    style: TextStyle(
                      color: primaryColor.withOpacity(0.8),
                      fontWeight: FontWeight.w300,
                      fontSize: 13,
                    ),
                  ),
                ]),
              ),
              trailing: Container(
                width: 100,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: onDeletePressed,
                      padding: EdgeInsets.only(left: 10),
                      icon: Icon(
                        Icons.delete,
                        size: 30,
                        color: accentColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      padding: EdgeInsets.only(left: 10),
                      icon: Icon(
                        Icons.edit,
                        size: 30,
                        color: secondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
