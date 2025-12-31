

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_expense/Ui/Screen%20page/onBording/Login_page.dart';

void main(){
  runApp(introScreen());
}

class introScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("asset/icon/overhead.png",width: 60,),
                    Text("Monety",style:GoogleFonts.poppins(fontSize: 23, fontWeight: FontWeight.bold,letterSpacing: 2),)
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Stack(
                    alignment: Alignment.bottomCenter,
                    children:[
                  Container(
                      width: double.infinity,
                      height: 350,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20)
                      ),
                     ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset("asset/images/expense-tracking.webp",width: 350,),
                          SizedBox(
                            height: 30,
                          ),
                          Text("Easy way to monitor your expense",textAlign:TextAlign.center, style: GoogleFonts.poppins(fontSize: 26, fontWeight: FontWeight.w800,letterSpacing: 3),),
                          Text(" Safe your future by managing your expense right now",textAlign:TextAlign.center, style: GoogleFonts.poppins(fontSize: 22,color: Colors.grey[500]),),
                          Container(
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.pink[400],
                              borderRadius:  BorderRadius.circular(10) ,
                            ),
                            child: IconButton(onPressed: (){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>logInPage()));
                            }, icon: Icon(Icons.arrow_forward,size: 50,color: Colors.white,)),
                          ),
                        ],
                      ),
                ]
                )
              ),
              Expanded(child: Container(color: Colors.white,),
                flex: 1,
              ),
            ],
          ),
        )
      ),
    );
  }
}