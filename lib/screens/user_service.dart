import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServices{

  //methode to store data
  static Future <void> storeUserData({
    required String userName, 
    required String email,
    required String password,
    required String confirmedPassword,
    required BuildContext context
    })async{


    try{
      
    //check
    if(password != confirmedPassword){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Password and Confirm Password do not match"),
          ),
      );
      return;
    }

    //if the password same then store users named and email
      //create an instance from shared pref
      SharedPreferences prefs = await SharedPreferences.getInstance();
      //store user name and email as a key
      await prefs.setString("username", userName);
      await prefs.setString("email", email);

      //show a massage to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("User Details stored successfuly."),
        ),
        );

    }catch(err){
      err.toString();
    }
  }
}