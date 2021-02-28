import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_wallet/services/object_handler.dart';

enum options { a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11 }
Widget createSimpleDialogOption(context,option,address){
  return SimpleDialogOption(
    onPressed: () {
      Navigator.pop(
        context,
        option,
      );
    },
    child: new ImageItemCard(
      imageAddress: address,
    ),
  );
}
List<Widget> createImageList(context) {
  List<Widget> result = [
    createSimpleDialogOption(context, options.a1, images[0]),
    createSimpleDialogOption(context, options.a2, images[1]),
    createSimpleDialogOption(context, options.a3, images[2]),
    createSimpleDialogOption(context, options.a4, images[3]),
    createSimpleDialogOption(context, options.a5, images[4]),
    createSimpleDialogOption(context, options.a6, images[5]),
    createSimpleDialogOption(context, options.a7, images[6]),
    createSimpleDialogOption(context, options.a8, images[7]),
    createSimpleDialogOption(context, options.a9, images[8]),
    createSimpleDialogOption(context, options.a10, images[9]),
    createSimpleDialogOption(context, options.a11, images[10]),
  ];
  return result;
}

Future<String> askedToLead(context) async {
  Size size = MediaQuery.of(context).size;
  switch (await showDialog<options>(
      context: context,
      builder: (BuildContext context) {
        final imageList = createImageList(context);
        return SimpleDialog(
          children: <Widget>[
            Container(
              height: size.height * 0.8,
              width: size.width * 0.9,
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(10),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: imageList ??
                    [
                      SimpleDialogOption(
                        onPressed: () {
                          Navigator.pop(context, options.a1);
                        },
                        child: ImageItemCard(
                          imageAddress: null,
                        ),
                      ),
                    ],
              ),
            ),
          ],
        );
      })) {
    case options.a1:
      print('0 in image picker');
      return images[0];
      break;
    case options.a2:
      print('1');
      return images[1];
      break;
    case options.a3:
      print(images[2]);
      return images[2];
      break;
    case options.a4:
      print(images[3]);
      return images[3];
      break;
    case options.a5:
      print(images[4]);
      return images[4];
      break;
    case options.a6:
      print(images[5]);
      return images[5];
      break;
    case options.a7:
      print(images[6]);
      return images[6];
      break;
    case options.a8:
      print(images[7]);
      return images[7];
      break;
    case options.a9:
      return images[8];
      break;
    case options.a10:
      print('10');
      return images[9];
      break;
    case options.a11:
      print('11');
      return images[10];
      break;
  }
}

class ImageItemCard extends StatelessWidget {
  final imageAddress;
  ImageItemCard({this.imageAddress});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(imageAddress ?? 'assets/images/Working.svg'),
    );
  }
}
