


import 'package:flutter/cupertino.dart';

class sizeBox_space extends StatelessWidget{
  double mHeight;
  double mWidth;
  sizeBox_space({this.mWidth = 0, this.mHeight = 10});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: mHeight,
      width: mWidth,
    );
  }
}