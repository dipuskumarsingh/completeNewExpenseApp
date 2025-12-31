


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class customTextField extends StatelessWidget{

   TextEditingController controller;
   String hintText;
   IconData? pre_fixIcon;
   IconData? suf_fixIcon;
   bool isPassword;
   TextInputType keyboardType;
  customTextField({required this.controller,this.pre_fixIcon, this.suf_fixIcon, required this.hintText, this.isPassword = false, this.keyboardType = TextInputType.text });
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,style: GoogleFonts.poppins(fontSize: 18,letterSpacing: 1.1),
      obscureText: isPassword,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: pre_fixIcon != null ? Icon(pre_fixIcon, color: Colors.grey,):null,
        suffixIcon: suf_fixIcon != null ? Icon(suf_fixIcon, color: Colors.grey,):null,
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey[400]),
        filled: true,
        fillColor: Colors.grey.shade100,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: Colors.blue, width: 1),
        )
      ),
    );
  }
}