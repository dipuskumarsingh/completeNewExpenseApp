import 'dart:async';

import 'package:flutter/material.dart';
import 'Ui/Screen page/intro_page.dart';

void main() {
  runApp(splaceScreen());
}

class splaceScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplaceScreen(),
    );
  }
}

class SplaceScreen extends StatefulWidget{
  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>introScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("asset/icon/budget.png",width:120,),
      ),
    );
  }
}
