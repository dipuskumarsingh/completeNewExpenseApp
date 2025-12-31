

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class homePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 200,
        actionsPadding: EdgeInsets.only(right: 15),
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            children: [
              Image.asset("asset/icon/overhead.png",),
              Text("Monety",style: GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.bold,letterSpacing: 2),)
            ],
          ),
        ),
        actions: [
          Icon(Icons.search_outlined,size: 40,)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            border: BoxBorder.all(width: 1,color: Colors.black),
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(image: AssetImage("asset/icon/alex-suprun-ZHvM3XIOHoE-unsplash.png"),fit: BoxFit.cover)
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      RichText(text: TextSpan(
                          text: "Good Morning\n",style: GoogleFonts.poppins(fontSize: 18,color: Colors.grey[700]),
                          children: [
                            TextSpan(
                              text: "Raj kumar",style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black,textStyle: TextStyle(overflow: TextOverflow.ellipsis)),
                            )
                          ]
                      )),
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("This month",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w600),),
                            Icon(Icons.arrow_drop_down_outlined)
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[400],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RichText(
                        text: TextSpan(
                            text: "Expense Total\n",style: GoogleFonts.poppins(fontSize: 23,fontWeight: FontWeight.w500),
                            children: [
                              TextSpan(
                                  text: "\$0,000\n",style: TextStyle(fontSize: 50,fontWeight: FontWeight.w800)
                              ),
                              TextSpan(
                                  text: "+\$240 ",style: TextStyle(backgroundColor: Colors.red[600],fontSize: 20)
                              ),
                              TextSpan(
                                  text: " than last month",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400)
                              ),
                            ]
                        )),
                    Stack(
                      children: [
                        Image.asset("asset/icon/budget.png",width: 150 ,)
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text("Expense List",style: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.w600),),
            ),
            Expanded(
                flex: 5,
                child: Container(color: Colors.orange,)),

          ],
        ),
      ),
    );
  }
}