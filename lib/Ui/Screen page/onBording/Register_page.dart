

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_expense/Data/Local/DB%20helper/localDataBase.dart';
import 'package:new_expense/Data/Local/Models/user_exp_model.dart';
import 'package:new_expense/Domain/Ui%20helper/customTextField.dart';
import 'package:new_expense/Ui/Screen%20page/onBording/Login_page.dart';

class registerPage extends StatelessWidget{
  TextEditingController nameController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController PhoneNumberController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  TextEditingController ConformPasswordController = TextEditingController();

  DB_Helper DbHelper = DB_Helper.getInstance();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0 , 10, 0),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                  child: Image.asset("asset/icon/overhead.png",width: 120, height: 120,)),
              Expanded(
                flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    Text("Register Now", style: GoogleFonts.poppins(fontSize: 30, fontWeight:  FontWeight.w600,letterSpacing:1,),),
                  Text("Please enter the details below to continue.", style: GoogleFonts.poppins(fontSize: 16, fontWeight:  FontWeight.normal,color: Colors.grey,),),
                      customTextField(
                        controller: nameController,
                        hintText: "Enter name",
                        keyboardType: TextInputType.text,
                      ),
                      customTextField(
                          controller: EmailController,
                          hintText: "abc123@gmail.com",
                        keyboardType: TextInputType.emailAddress,
                      ),
                      customTextField(
                        controller: PhoneNumberController,
                        hintText: "+91 0000000000",
                        keyboardType: TextInputType.number,
                      ),
                      customTextField(
                        controller: PasswordController,
                        hintText: "Password",
                        suf_fixIcon:  CupertinoIcons.eye_slash,
                        keyboardType: TextInputType.visiblePassword,
                        isPassword: true,
                      ),
                      customTextField(
                        controller: ConformPasswordController,
                        hintText: "Conform Password",
                        suf_fixIcon:  CupertinoIcons.eye_slash,
                        keyboardType: TextInputType.visiblePassword,
                        isPassword: true,
                      ),
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap:()async{
                          /// doing registration operation
                          if(!await DbHelper.isUserAlreadyRegister(Email: EmailController.text,)){
                            userModel new_User = userModel(name: nameController.text, Email: EmailController.text, phone_Number: PhoneNumberController.text, password: PasswordController.text, createdAt: DateTime.now().millisecondsSinceEpoch.toString());
                           bool check  = await DbHelper.userRegister(newUser: new_User);
                           if(check){
                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User Successfully register, please try again",style: TextStyle(color: Colors.red),)));
                             Navigator.pop(context);
                           }else{
                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Something went wrong, please try again",style: TextStyle(color: Colors.red),)));
                           }
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User already register, login Now")));
                          }
                        },
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                          color: Colors.blue[600],
                            borderRadius: BorderRadius.circular(20)
                        ),
                          child: Center(child: Text("Register", style: GoogleFonts.poppins(fontSize: 21, fontWeight: FontWeight.bold,color:  Colors.white,letterSpacing:1,)),),
                        ),
                      ),
                      Divider(
                        thickness: 1.5,
                        color: Colors.grey[300],
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>logInPage()));
                        },
                        child: RichText(text: TextSpan(
                            text: "You have an account! ",style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.normal,color: Colors.black,),
                            children: [
                              TextSpan(
                                  text:"Login" ,style: GoogleFonts.poppins(fontSize: 17, color: Colors.red))
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