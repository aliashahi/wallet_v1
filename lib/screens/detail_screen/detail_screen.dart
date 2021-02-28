import 'package:flutter/material.dart';
import 'package:my_wallet/constants/colors.dart';
import 'package:my_wallet/screens/add_edit_screen/add_edit_screen.dart';
import 'package:my_wallet/screens/home_screen/components/bottom_navigate_bar.dart';
import 'package:my_wallet/screens/home_screen/components/insert_sub_dialog.dart';
import 'package:my_wallet/screens/home_screen/components/title_with_searchbar.dart';
import 'package:my_wallet/services/object_handler.dart';

import 'components/in_out_come_list.dart';
import 'components/main_title_card.dart';

class DetailScreen extends StatefulWidget {
  final Case element;
  DetailScreen({Key key, this.element}) : super(key: key);
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  void search(value) {
    print(value);
  }
  appBar(){
    return AppBar(
      bottomOpacity: 0,
      backgroundColor: primaryColor,
      leading: IconButton(
        icon: Icon(Icons.keyboard_backspace,
        color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        // appBar: appBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            onInsertSub(context, widget.element);
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: primaryColor,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            HeaderAndSearchBar(
              title: '',
              search: search,
            ),
            MainTitleCard(
              element: widget.element,
            ),
            SingleChildScrollView(
              child: InOutComeList(
                element: widget.element,
              ),
            ),
          ]),
        ),
        bottomNavigationBar: BottomNavigatorBar(),
      ),
    );
  }
}
