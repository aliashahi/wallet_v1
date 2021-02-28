import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_wallet/constants/colors.dart';
import 'package:my_wallet/screens/add_edit_screen/add_edit_screen.dart';
import 'package:my_wallet/screens/home_screen/components/bottom_navigate_bar.dart';
import 'package:my_wallet/screens/home_screen/components/favorite_list.dart';
import 'components/title_with_searchbar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AppBar appBar() {
    return AppBar(
      backgroundColor: primaryColor,
      // leading: Icon(Icons.menu),
      title: Text('WALLI WALLET'),
      elevation: 0,
    );
  }

  void search(value) {
    print(value.toString() + 'this is search value');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Scaffold(
        appBar: appBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddEditScreen(),
              ),
            );
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: primaryColor,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(children: [
              HeaderAndSearchBar(
                title: '',
                search: search,
              ),
              FavoriteList(),
            ]),
          ),
        ),
        bottomNavigationBar: BottomNavigatorBar(),
      ),
    );
  }
}
