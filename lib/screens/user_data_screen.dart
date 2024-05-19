import 'package:expenz/constants/colors.dart';
import 'package:expenz/constants/constants.dart';
import 'package:expenz/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserDataScreen extends StatefulWidget {
  const UserDataScreen({super.key});

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {

  bool _remeberMe = false;

  //form key
  final _formKey = GlobalKey<FormState>();

  //controllers
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _userEmailController = TextEditingController();
  final TextEditingController _userPasswordController = TextEditingController();
  final TextEditingController _userConfirmedPasswordController = TextEditingController();
  
  @override
  void dispose() {
    // TODO: implement dispose
    _userNameController.dispose();
    _userEmailController.dispose();
    _userPasswordController.dispose();
    _userConfirmedPasswordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(child: 
        Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Enter Your \nPersonal Details",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500
              ),
              ),
              SizedBox(height: 30,),
              //form
              Form(
                key: _formKey,
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _userNameController,
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Please Enter Your Name";
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                      ),
                      contentPadding: EdgeInsets.all(20)
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    controller: _userEmailController,
                    validator: (value) {
                      if(value!.isEmpty){
                        return("Please Enter Your Email");
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                      ),
                      contentPadding: EdgeInsets.all(20)
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    controller: _userPasswordController,
                    validator: (value){
                      if(value!.isEmpty){
                        return("Please Enter valid Password");
                      }
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                      ),
                      contentPadding: EdgeInsets.all(20)
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    controller: _userConfirmedPasswordController,
                    validator: (value) {
                      if(value!.isEmpty){
                        return("Please Enter Same Password");
                      }
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                      ),
                      contentPadding: EdgeInsets.all(20)
                    ),
                  ),
                  SizedBox(height: 15,),

                  Row(
                    children: [
                      Text("Remember Me for the next time",style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: kGrey
                      ),),
                      Expanded(child: 
                      CheckboxListTile(
                        activeColor: kMainColor,
                        value: _remeberMe,onChanged: (value) {
                        setState(() {
                          _remeberMe = value!;
                        });
                      },),
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                   GestureDetector(
                    onTap: () {
                      if(_formKey.currentState!.validate()){
                        String userName = _userNameController.text;
                        String email = _userEmailController.text;
                        String password = _userPasswordController.text;
                        String confirmedPassword = _userConfirmedPasswordController.text;

                        print("$userName $email $password $confirmedPassword");
                      }
                    },
                    child: CustomButton(
                      buttonName: "Next", 
                      buttonColor: kMainColor
                      ))
                ],
              ),
              ),
            ],
          ),
        ),),
      ),
    );
  }
}