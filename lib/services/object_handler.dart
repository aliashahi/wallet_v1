import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class CaseHandler {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    String path = await _localPath;
    return File('$path/cases.txt');
  }

  Future<void> insertCase(List<Case> objects) async {
    File file = await _localFile;
    String data = Case.encode(objects);
    await file.writeAsString(data);
  }

  Future<List<Case>> getCases() async {
    File file = await _localFile;
    String cases = await file.readAsString();
    if (cases != null && cases.length > 0) {
      final List<Case> data = Case.decode(cases);
      return data;
    } else {
      await file.writeAsString('[]');
      return [];
    }
  }

  saveSub(Case element, int enteredAmount) async {
    InOutCome inOutCome = InOutCome(
      isIncome: element.isIncome,
      lastModifiedTime: DateTime.now().toString(),
      id: Uuid().v4(),
      desc: '',
      amount: enteredAmount,
    );
    element.inOutComes.add(inOutCome);
    element.fullAmount += inOutCome.amount;
    List<Case> list = await getCases();
    List<Case> list2 = [];
    list.forEach((e) {
      if (e.id == element.id)
        list2.add(element);
      else
        list2.add(e);
    });
    await insertCase(list2);
  }
  removeSub(Case element, InOutCome sub) async {
    InOutCome inOutCome;
    element.inOutComes.forEach((e) {
      if(e.id==sub.id){
        inOutCome=e;
      }
    });
    element.inOutComes.remove(inOutCome);
    element.fullAmount -= inOutCome.amount;
    List<Case> list = await getCases();
    List<Case> list2 = [];
    list.forEach((e) {
      if (e.id == element.id)
        list2.add(element);
      else
        list2.add(e);
    });
    await insertCase(list2);
  }
  Future<int> getIncomeFullAmount() async{
    List<Case> cases=await getCases();
    int amount=0;
    cases.forEach((element) {
      if(element.isIncome)
      amount+=element.fullAmount;
    });
    return amount;
  }
  Future<int> getOutcomeFullAmount() async{
    List<Case> cases=await getCases();
    int amount=0;
    cases.forEach((element) {
      if(!element.isIncome)
        amount+=element.fullAmount;
    });
    return amount;
  }
}

class Case {
  final String id;
  String title;
  String desc;
  String imageAddress;
  bool isIncome;
  String lastModifiedTime;
  List<InOutCome> inOutComes;
  int fullAmount;
  Case({
    this.id,
    this.title,
    this.desc,
    this.imageAddress,
    this.isIncome,
    this.lastModifiedTime,
    this.inOutComes,
    this.fullAmount,
  });

  factory Case.fromJson(Map<String, dynamic> parsedJson) {
    return new Case(
      id: parsedJson['id'],
      title: parsedJson['title'],
      desc: parsedJson['desc'],
      imageAddress: parsedJson['imageAddress'],
      isIncome: parsedJson['isIncome'] == 'true',
      lastModifiedTime: parsedJson['lastModifiedTime'],
      inOutComes: InOutCome.decode(parsedJson['inOutComes']),
      fullAmount: int.parse(parsedJson['fullAmount']),
    );
  }

  static Map<String, dynamic> toMap(Case object) => {
        "id": object.id,
        "title": object.title,
        "desc": object.desc,
        "imageAddress": object.imageAddress,
        "isIncome": object.isIncome.toString(),
        "lastModifiedTime": object.lastModifiedTime,
        "inOutComes": InOutCome.encode(object.inOutComes),
        "fullAmount": object.fullAmount.toString(),
      };

  static String encode(List<Case> objects) => json.encode(
        objects
            .map<Map<String, dynamic>>((object) => Case.toMap(object))
            .toList(),
      );

  static List<Case> decode(String objects) =>
      (json.decode(objects) as List<dynamic>)
          .map<Case>((item) => Case.fromJson(item))
          .toList();
}

class InOutCome {
  final String id;
  String desc;
  bool isIncome;
  String lastModifiedTime;
  int amount;
  InOutCome(
      {this.id, this.desc, this.isIncome, this.lastModifiedTime, this.amount});

  factory InOutCome.fromJson(Map<String, dynamic> parsedJson) {
    return new InOutCome(
        id: parsedJson['id'],
        desc: parsedJson['desc'],
        isIncome: parsedJson['isIncome'] == 'true',
        lastModifiedTime: parsedJson['lastModifiedTime'] ?? "",
        amount: int.tryParse(parsedJson['amount']),);
  }

  static Map<String, dynamic> toMap(InOutCome object) => {
        "id": object.id,
        "desc": object.desc,
        "isIncome": object.isIncome.toString(),
        "lastModifiedTime": object.lastModifiedTime,
        "amount": object.amount.toString(),
      };

  static String encode(List<InOutCome> objects) => json.encode(
        objects
            .map<Map<String, dynamic>>((object) => InOutCome.toMap(object))
            .toList(),
      );

  static List<InOutCome> decode(String objects) =>
      (json.decode(objects) as List<dynamic>)
          .map<InOutCome>((item) => InOutCome.fromJson(item))
          .toList();
}

//mock data;
// List<Case> mockdata = [
//   Case(
//     id: Uuid().v4(),
//     title: 'Snapp',
//     imageAddress: 'assets/images/undraw_successful_purchase_uyin.svg',
//     desc: 'nothing to say ,just watch it ,i bet you like it',
//     lastModifiedTime: DateTime.now().toString(),
//     fullAmount: 12000,
//     inOutComes: [],
//     isIncome: false,
//   ),
//   Case(
//     id: Uuid().v4(),
//     title: 'Food',
//     imageAddress:  'assets/images/undraw_Specs_djh3.svg',
//     desc: 'nothing to say ,just watch it ,i bet you like it',
//     lastModifiedTime: DateTime.now().toString(),
//     fullAmount: 12000,
//     inOutComes: [],
//     isIncome: false,
//   ),
//   Case(
//     id: Uuid().v4(),
//     title: 'Book',
//     imageAddress:  'assets/images/undraw_Payments_re_77x0.svg',
//     desc: 'nothing to say ,just watch it ,i bet you like it',
//     lastModifiedTime: DateTime.now().toString(),
//     fullAmount: 12000,
//     inOutComes: [],
//     isIncome: false,
//   ),
//   Case(
//     id: Uuid().v4(),
//     title: 'Salery',
//     imageAddress:  'assets/images/undraw_online_wishes_dlmr.svg',
//     desc: 'nothing to say ,just watch it ,i bet you like it',
//     lastModifiedTime: DateTime.now().toString(),
//     fullAmount: 12000,
//     inOutComes: [],
//     isIncome: true,
//   ),
//   Case(
//     id: Uuid().v4(),
//     title: 'Snapp',
//     imageAddress:  'assets/images/undraw_jewelry_iima.svg',
//     desc: 'nothing to say ,just watch it ,i bet you like it',
//     lastModifiedTime: DateTime.now().toString(),
//     fullAmount: 12000,
//     inOutComes: [],
//     isIncome: true,
//   ),
//   Case(
//     id: Uuid().v4(),
//     title: 'Snapp',
//     imageAddress:  'assets/images/undraw_Hamburger_8ge6.svg',
//     desc: 'nothing to say ,just watch it ,i bet you like it',
//     lastModifiedTime: DateTime.now().toString(),
//     fullAmount: 12000,
//     inOutComes: [],
//     isIncome: true,
//   ),
//   Case(
//     id: Uuid().v4(),
//     title: 'Snapp',
//     imageAddress:  'assets/images/undraw_electric_car_b7hl.svg',
//     desc: 'nothing to say ,just watch it ,i bet you like it',
//     lastModifiedTime: DateTime.now().toString(),
//     fullAmount: 12000,
//     inOutComes: [],
//     isIncome: true,
//   ),
// ];
List<String> images = [
  'assets/images/Car.svg',
  'assets/images/Clothes.svg',
  'assets/images/Food.svg',
  'assets/images/Jewelry.svg',
  'assets/images/Needs.svg',
  'assets/images/Onlineshop.svg',
  'assets/images/Payments.svg',
  'assets/images/Present.svg',
  'assets/images/Sport.svg',
  'assets/images/Travel.svg',
  'assets/images/Working.svg',
];
