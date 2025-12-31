import 'package:new_expense/Data/Local/DB%20helper/localDataBase.dart';

/// creating user and expense model both in one dart file.

/// this for user model
class userModel {
  int user_Id;
  String name;
  String Email;
  String phone_Number;
  String password;
  String createdAt;

  userModel({
    this.user_Id = 0,
    required this.name,
    required this.Email,
    required this.phone_Number,
    required this.password,
    required this.createdAt,
  });

  ///from map

  factory userModel.fromMap(Map<String, dynamic> mMap) {
    return userModel(
      user_Id: mMap[DB_Helper.USER_ID],
      name: mMap[DB_Helper.USER_NAME],
      Email: mMap[DB_Helper.USER_EMAIL],
      phone_Number: mMap[DB_Helper.USER_PHONENUMBER],
      password: mMap[DB_Helper.USER_PASSOWRD],
      createdAt: mMap[DB_Helper.USER_CREATEDAT],
    );
  }

  /// To map
  Map<String, dynamic> toMap() {
    /// converting into map
    return {
      DB_Helper.USER_ID: user_Id,
      DB_Helper.USER_NAME: name,
      DB_Helper.USER_EMAIL: Email,
      DB_Helper.USER_PHONENUMBER: phone_Number,
      DB_Helper.USER_PASSOWRD: password,
      DB_Helper.USER_CREATEDAT: createdAt,
    };
  }
}

/// this for the Expense Data model

class ExpenseModel {
  int user_ID;
  int exp_ID;
  String exp_title;
  String exp_amount;
  String exp_balance;
  String exp_type;

  ExpenseModel({
    this.user_ID = 0,
    this.exp_ID = 0,
    required this.exp_title,
    required this.exp_amount,
    required this.exp_balance,
    required this.exp_type,
  });

  /// from map
  factory ExpenseModel.fromMap(Map<String, dynamic> mMap) {
    return ExpenseModel(
      user_ID: mMap[DB_Helper.USER_ID],
      exp_ID: mMap[DB_Helper.EXP_ID],
      exp_title: mMap[DB_Helper.EXP_TITLE],
      exp_amount: mMap[DB_Helper.EXP_AMOUNT],
      exp_balance: mMap[DB_Helper.EXP_BALANCE],
      exp_type: mMap[DB_Helper.EXP_TYPE],
    );
  }

  /// to map
  Map<String, dynamic> toMap() {
    return {
      DB_Helper.USER_ID: user_ID,
      DB_Helper.EXP_ID: exp_ID,
      DB_Helper.EXP_TITLE: exp_title,
      DB_Helper.EXP_AMOUNT: exp_amount,
      DB_Helper.EXP_BALANCE: exp_balance,
      DB_Helper.EXP_TYPE: exp_type,
    };
  }
}


/// Category model

class categoryModel{
  int id;
  String catTitle;
  categoryModel({required this.id, required this.catTitle});
}