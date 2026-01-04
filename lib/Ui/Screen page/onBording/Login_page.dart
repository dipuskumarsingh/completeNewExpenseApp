

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_expense/Data/Local/DB%20helper/localDataBase.dart';
import 'package:new_expense/Domain/Ui%20helper/customTextField.dart';
import 'package:new_expense/Domain/Ui%20helper/sizeBoxSpeaceing.dart';
import 'package:new_expense/Ui/Screen%20page/onBording/Register_page.dart';
import '../../../Domain/Ui helper/BottomNavigation.dart';

class logInPage extends StatelessWidget{
  TextEditingController EmailControler = TextEditingController();
  TextEditingController PasswordControler = TextEditingController();

  DB_Helper DbHelper = DB_Helper.getInstance();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                  child: Center(child: Image.asset("asset/icon/overhead.png",width: 120, height: 120,)),
              ),
              Expanded(
                flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Login Now", style: GoogleFonts.poppins(fontSize: 30, fontWeight:  FontWeight.w600,letterSpacing:1,),),
                      Text("Please enter the details below to continue.", style: GoogleFonts.poppins(fontSize: 16, fontWeight:  FontWeight.normal,color: Colors.grey,),),
                      customTextField(
                          controller: EmailControler,
                          hintText: "abcd123@email.com",
                        keyboardType: TextInputType.emailAddress,
                      ),
                      customTextField(
                          controller: PasswordControler,
                          hintText: "Password",
                        isPassword: true,
                        suf_fixIcon: CupertinoIcons.eye_slash,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Forgot Password?", style: GoogleFonts.poppins(fontSize: 17, fontWeight:  FontWeight.normal,color: Colors.red,),textAlign: TextAlign.right,),
                        ],
                      ),
                    ],
                  )),
              Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: ()async{
                          /// here doing login operation
                        bool check = await  DbHelper.userAuthenticate(Email: EmailControler.text, pass: PasswordControler.text);
                        if(check){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>bottomNavigationBar()));
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("invalid email or password")));
                        }
                        },
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration:  BoxDecoration(
                            color: Colors.blue[600],
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Center(child:  Text("Login",style: GoogleFonts.poppins(fontSize: 21, fontWeight: FontWeight.bold,color:  Colors.white,letterSpacing:1,),),),
                        ),
                      ),
                      sizeBox_space(),
                      Divider(
                        thickness: 1.5,
                        color: Colors.grey[300],
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>registerPage()));
                        },
                        child: RichText(text: TextSpan(
                            text: "Don't have an account! ",style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.normal,color: Colors.black,),
                            children: [
                          TextSpan(
                              text:"Register" ,style: GoogleFonts.poppins(fontSize: 17, color: Colors.red))
                        ])),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}