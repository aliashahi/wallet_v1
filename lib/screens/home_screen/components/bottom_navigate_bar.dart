import 'package:flutter/material.dart';
import 'package:my_wallet/constants/colors.dart';
import '../home_screen.dart';

class BottomNavigatorBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 0,
            spreadRadius: 10,
            color: Colors.white10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.list,
              color: secondaryColor,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,MaterialPageRoute(
                builder: (_)=>HomeScreen(),
              ));
            },
            child: Icon(
              Icons.home,
              color: Colors.white,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.leaderboard,
              color: secondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
