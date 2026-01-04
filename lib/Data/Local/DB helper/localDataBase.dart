

import 'package:new_expense/Data/Local/Models/user_exp_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

/// creating local data base system

class DB_Helper{

  ///create the global variable
  /// this is for the user table
  static final USER_TABLE = "user_data";
  static final USER_ID = "user_id";
  static final USER_NAME = "user_name";
  static final USER_EMAIL = "user_email";
  static final USER_PHONENUMBER = "user_phoneNumber";
  static final USER_PASSOWRD = "user_password";
  static final USER_CREATEDAT = "user_createdAt";

  /// this is for the Expense data table
  static final EXP_TABLE = "Expense_data";
  static final EXP_USER_ID = "user_id";
  static final EXP_ID = "exp_id";
  static final EXP_TITLE = "exp_title";
  static final EXP_AMOUNT = "exp_amount";
  static final EXP_BALANCE = "exp_balance";
  static final EXP_TYPE = "exp_type";


  /// Creating getInstance
  DB_Helper._();
  static DB_Helper getInstance()=>DB_Helper._();

  ///get data-base
      Database? mDB;
     Future<Database>getData_base()async{
       mDB ??= await open_Db();
        return mDB!;
}

  /// open
  Future<Database>open_Db() async{
    var appDirectory =  await getApplicationDocumentsDirectory(); /// this is used for the creating path
    String pathDirectory = join(appDirectory.path, "mainDB.db"); /// this is used for the join the path with directory.
    return openDatabase(pathDirectory, version: 1, onCreate: (db,version){


      /// create
      db.execute("create table $USER_TABLE ( $USER_ID integer primary key autoincrement, $USER_NAME text, $USER_EMAIL text, $USER_PHONENUMBER text, $USER_PASSOWRD text, $USER_CREATEDAT text )");

      /// this is way to apply query in SQL
      ///db.execute("create table Expense_data ( user_id integer foreign key,exp_id integer primary key autoincrement exp_title text, exp_amount real, exp_balance real, exp_type integer )");


      db.execute("create table $EXP_TABLE ( $EXP_USER_ID integer foreign key,$EXP_ID integer primary key autoincrement $EXP_TITLE text, $EXP_AMOUNT real, $EXP_BALANCE real, $EXP_TYPE integer )");
    });



}
  /// query part
  /// register new user
  Future<bool>userRegister({required userModel newUser})async{
       var DB = await getData_base();
         int rowsEffected = await DB.insert(USER_TABLE, newUser.toMap());
         return rowsEffected>0;
  }
  /// check user already register
  Future<bool>isUserAlreadyRegister({required String Email})async{
       var DB= await getData_base();
      //List<Map<String, dynamic>> mData =  await DB.query(USER_TABLE,where: "$USER_EMAIL = ? OR $USER_PHONENUMBER = ? ", whereArgs: [Email],);
      List<Map<String, dynamic>> mData =  await DB.query(USER_TABLE,where: "$USER_EMAIL = ?", whereArgs: [Email],);

      return mData.isNotEmpty;
      /*if(mData.isNotEmpty){ both are same
        return true;
      }else{
        return false;
      }*/

  }


  /// user authenticate
Future<bool> userAuthenticate({required String Email, required String pass})async{
       var DB = await getData_base();
     List<Map<String, dynamic>> mData =  await  DB.query(USER_TABLE, where: "$USER_EMAIL = ? AND $USER_PASSOWRD = ? ", whereArgs: [Email, pass]);

     /// if user authenticate save user id and password  using shared preference
       if(mData.isNotEmpty){
         var prefs = await SharedPreferences.getInstance();
         prefs.setInt("User", mData[0][USER_ID]);
       }
     return mData.isNotEmpty;
}
}