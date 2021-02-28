import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_wallet/constants/colors.dart';
import 'package:my_wallet/screens/detail_screen/detail_screen.dart';
import 'package:my_wallet/services/object_handler.dart';

class FavoriteListCard extends StatelessWidget {
  FavoriteListCard({Key key, this.element, this.onInsetSub, this.totalAmount})
      : super(key: key);
  final Case element;
  final int totalAmount;
  final Function onInsetSub;

  addSubDialog(BuildContext context, Case element) {}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        // color: warnColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 10,
            spreadRadius: 0,
            color: Colors.black.withOpacity(0.2),
          ),
        ],
      ),
      width: size.width * 0.4,
      height: size.height * 0.25,
      child: Column(
        children: [
          Expanded(
            child: ListTile(
              title: Text(
                element.title,
                style: TextStyle(
                  color: primaryColor.withOpacity(0.8),
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              trailing: IconButton(
                onPressed: onInsetSub,
                padding: EdgeInsets.only(left: 30),
                icon: Icon(
                  Icons.add,
                  size: 30,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailScreen(element: element),
                  ));
            },
            child: Stack(
              children: [
                Container(
                  height: 120,
                  width: 120,
                  margin: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                  child: CircularProgressIndicator(
                    backgroundColor:
                        element.isIncome ? secondaryColor : accentColor,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white54),
                    value: 1 - element.fullAmount / (totalAmount ?? 500000),
                    strokeWidth: 10,
                    semanticsValue: 'dd',
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
          // Container(
          //   child: Row(
          //     children: [
          //       RichText(
          //         text: TextSpan(
          //           children: [
          //             TextSpan(
          //               text: element.title + '\n'.toUpperCase(),
          //               style: Theme.of(context)
          //                   .textTheme
          //                   .button
          //                   .copyWith(fontSize: 17, height: 2),
          //             ),
          //             TextSpan(
          //               text: element.fullAmount.toString() + ' \$',
          //               style: TextStyle(
          //                   color: Colors.black.withOpacity(0.5),
          //                   fontSize: 25),
          //             ),
          //           ],
          //         ),
          //       ),
          //       Spacer(),
          //       Icon(
          //         Icons.circle,
          //         color: element.isIncome ? Colors.green : Colors.red,
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
// Container(
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(70),
// boxShadow: [
// BoxShadow(
// offset: Offset(1, 1),
// color: Colors.white,
// blurRadius: 10,
// spreadRadius: 10,
// ),
// ],
// ),
// child: Stack(
// children: [
// ClipRRect(
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(15),
// topRight: Radius.circular(15),
// ),
// child: SvgPicture.asset(
// element.imageAddress,
// fit: BoxFit.contain,
// width: 200,
// height: 180,
// ),
// ),
// ],
// ),
// ),
