import 'package:flutter/material.dart';
import 'package:my_wallet/constants/colors.dart';
import 'package:my_wallet/screens/detail_screen/components/in_out_come_card.dart';
import 'package:my_wallet/screens/detail_screen/components/remove_sub_dialog.dart';
import 'package:my_wallet/services/object_handler.dart';
import 'package:uuid/uuid.dart';

class InOutComeList extends StatefulWidget {
  InOutComeList({Key key, this.element}) : super(key: key);
  final Case element;
  @override
  _InOutComeList createState() => _InOutComeList();
}

class _InOutComeList extends State<InOutComeList> {
  final caseHandler = new CaseHandler();
  List<Widget> list = [];
  // _InOutComeList() {
  //   createList();
  // }
  Future<void> createList() async {
    setState(() {
      list = [];
    });
    List<Widget> temp = [];
    widget.element.inOutComes.forEach((e) {
      temp.add(
        InOutComeCard(
          element: e,
          imageAddress: widget.element.imageAddress,
          onDeletePressed: () {
            onDeleteSub(context, widget.element, e);
          },
        ),
      );
    });
    setState(() {
      list = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    createList();
    Size size = MediaQuery.of(context).size;
    return RefreshIndicator(
      onRefresh: createList,
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: list,
          ),
        ),
      ),
    );
  }
}
