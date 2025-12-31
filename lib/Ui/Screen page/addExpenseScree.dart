

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_expense/Domain/Ui%20helper/BottomNavigation.dart';
import 'package:new_expense/Domain/Ui%20helper/customTextField.dart';
import 'package:new_expense/Domain/Ui%20helper/customTextStyle.dart';
import 'package:new_expense/Ui/Screen%20page/homePage.dart';

class addExpense extends StatelessWidget{
  TextEditingController Add_Amount = TextEditingController();
  TextEditingController Add_Note = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add expense",style: GoogleFonts.poppins(fontSize: 22,fontWeight: FontWeight.w600),),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: Column(
          children: [
            Expanded(
              flex: 6,
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Amount",style: GoogleFonts.poppins(fontSize: 21,fontWeight: FontWeight.bold)),
                    customTextField(
                        controller: Add_Amount,
                        pre_fixIcon: Icons.currency_rupee_outlined,
                        hintText: "Amount...",
                    ),
                    Text("Select Category",style: GoogleFonts.poppins(fontSize: 21,fontWeight: FontWeight.bold)),
                    Container(
                      width: double.infinity,
                      height: 120,
                      color: Colors.lightBlue,
                    ),
                    Text("Write Note",style: GoogleFonts.poppins(fontSize: 21,fontWeight: FontWeight.bold)),
                    customTextField(
                        controller: Add_Note,
                        hintText: "Enter a Note..."),
                    Text("Set Date",style: GoogleFonts.poppins(fontSize: 21,fontWeight: FontWeight.bold)),
                    customTextField(
                        controller: Add_Note,
                        hintText: "Date",
                      suf_fixIcon: Icons.date_range_outlined,
                    )
                  ],
                )),
            Expanded(
              flex: 1,
                child:const SizedBox()),
            Expanded(
              flex: 1,
                child:Column(
                  children: [
                    Expanded(
                      flex: 1,
                        child: const SizedBox()),
                    Expanded(
                      flex: 3,
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (ctx)=>bottomNavigationBar()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blue,
                              borderRadius: BorderRadius.circular(25)
                            ),

                            child:Center(child: Text("Save",style: GoogleFonts.poppins(fontSize: 21,fontWeight: FontWeight.w600,color: Colors.white,letterSpacing: 1),)),),
                        )),
                  ],
                )),
          ],
        ),
      )
    );
  }
}
