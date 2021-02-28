import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_wallet/screens/add_edit_screen/components/image_picker_dialog.dart';
import 'package:my_wallet/services/object_handler.dart';
import 'package:uuid/uuid.dart';
import 'package:my_wallet/constants/colors.dart';
import 'package:my_wallet/screens/add_edit_screen/components/image_card.dart';
import 'package:my_wallet/screens/add_edit_screen/components/input_field.dart';
import 'package:my_wallet/screens/home_screen/home_screen.dart';

class AddEditScreen extends StatefulWidget {
  @override
  _AddEditScreenState createState() => _AddEditScreenState();
}

class _AddEditScreenState extends State<AddEditScreen> {
  List<Case> list=[];
  String imageAddress = 'assets/images/Working.svg';
  String title;
  String subtitle;
  String desc;
  bool isincome = false;
  int episodes;
  _AddEditScreenState(){
    getList();
  }
  getList() async {
    final caseHandler = new CaseHandler();
    list=await caseHandler.getCases();
  }
  getImage() async{
    String address=await askedToLead(context);
    setState(() {
      imageAddress=null;
      imageAddress=address;
    });
  }

  submit() async {
    final caseHandler = new CaseHandler();
    Case object = new Case(
      id: Uuid().v4(),
      title: title,
      desc: desc,
      imageAddress: imageAddress,
      lastModifiedTime: DateTime.now().toString(),
      isIncome: isincome,
      fullAmount: 0,
      inOutComes: [],
    );
    list.add(object);
    await caseHandler.insertCase(list);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageCard(
              imageAddress: imageAddress,
              getImage: getImage,
              backBtn: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
            ),
            InputField(
              placeHolder: 'name',
              onValueChange: (value) {
                title = value;
              },
              textInputType: TextInputType.text,
            ),
            InputField(
              placeHolder: 'description',
              onValueChange: (value) {
                desc = value;
              },
              textInputType: TextInputType.multiline,
            ),
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  'Is it income?',
                  style: TextStyle(color: primaryColor, fontSize: 18),
                ),
                trailing: Switch(
                  onChanged: (value) {
                    setState(() {
                      isincome = !isincome;
                    });
                  },
                  value: isincome ?? false,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: RaisedButton(
                onPressed: submit,
                color: primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Add To LIST',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
