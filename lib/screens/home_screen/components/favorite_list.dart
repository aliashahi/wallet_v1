import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_wallet/constants/colors.dart';
import 'package:my_wallet/services/object_handler.dart';

import 'favorite_list_card.dart';
import 'insert_sub_dialog.dart';

class FavoriteList extends StatefulWidget {
  @override
  _FavoriteListState createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  final caseHandler = new CaseHandler();
  List<Widget> list = [];

  _FavoriteListState() {
    createList();
  }

  Future<void> createList() async {
    final objects = await caseHandler.getCases();
    final fullIncomeAmount=await caseHandler.getIncomeFullAmount();
    final fullOutcomeAmount=await caseHandler.getOutcomeFullAmount();
    setState(() {
      list = [];
    });
    List<Widget> temp = [];
    objects.forEach((element) {
      if(element.isIncome)
      temp.add(
        FavoriteListCard(
          element: element,
          onInsetSub: () {
            onInsertSub(context, element);
          },
          totalAmount: fullIncomeAmount,
        ),
      );
      else
      temp.add(
        FavoriteListCard(
          element: element,
          onInsetSub: () {
            onInsertSub(context, element);
          },
          totalAmount: fullOutcomeAmount,
        ),
      );
    });
    setState(() {
      list = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      child: RefreshIndicator(
        onRefresh: createList,
        child: GridView.count(
          scrollDirection: Axis.vertical,
          primary: false,
          childAspectRatio: ((size.height*0.2)/(size.width*0.5)),
          padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom:300),
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          crossAxisCount: 2,
          children: list,
        ),
      ),
    );
  }
}