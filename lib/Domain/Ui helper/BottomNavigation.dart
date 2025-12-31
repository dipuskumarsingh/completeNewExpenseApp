

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_expense/Ui/Screen%20page/Chartscreen.dart';
import 'package:new_expense/Ui/Screen%20page/addExpenseScree.dart';
import 'package:new_expense/Ui/Screen%20page/homePage.dart';
import 'package:new_expense/Ui/Screen%20page/onBording/Login_page.dart';

class bottomNavigationBar extends StatefulWidget{
  @override
  State<bottomNavigationBar> createState() => _bottomNavigationBarState();
}

class _bottomNavigationBarState extends State<bottomNavigationBar> {
  int SelectedIndex = 0;
  List<Widget> AllpagesUi = [
    homePage(),
    chartScreen(),
    addExpense(),
    chartScreen(),
    chartScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.blue,
          destinations: [
            NavigationDestination(
              selectedIcon: Icon(Icons.home,color: Colors.white,),
                icon: Icon(Icons.home_outlined), label: "Home"),
            NavigationDestination(
              selectedIcon:  Icon(Icons.bar_chart,color: Colors.white,),
                icon: Icon(Icons.bar_chart_outlined), label: "Chart"),
            NavigationDestination(
                selectedIcon:  Icon(Icons.add,color: Colors.white,),
                icon: Icon(Icons.add_outlined,), label: "Add"),
            NavigationDestination(
                selectedIcon:  Icon(Icons.notifications_outlined,color: Colors.white,),
                icon: Icon(Icons.notifications), label: "Notification"),
            NavigationDestination(
                selectedIcon:  Icon(Icons.settings_outlined,color: Colors.white,),
                icon: Icon(Icons.settings), label: "Setting"),
          ],
         selectedIndex: SelectedIndex,
         onDestinationSelected: (value){
            SelectedIndex = value;
            setState(() {

            });
             },
      ),

      /// body ui part
      body: AllpagesUi[SelectedIndex], /// this is used for navigate the pages.
    );
  }
}