import 'dart:convert';

import 'package:deneme2/api_connection/api_connection.dart';
import 'package:deneme2/fragments/dashboard_of_fragments.dart';
import 'package:deneme2/users/authentication/sign_page.dart';
import 'package:deneme2/userPreferences/user_preferences.dart';
import '../model/user.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;



class LoginPage extends StatefulWidget
{

  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
{
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isObsecure = true.obs;


  loginUserNow() async
  {
    try
    {
      var res = await http.post(
        Uri.parse(API.login),
        body: {
          "user_email":emailController.text.trim(),
          "user_password":passwordController.text.trim(),
        },
      );

      if (res.statusCode == 200) {
        var resBodyOfLogin = jsonDecode(res.body);
        if (resBodyOfLogin['success'] == true) {
          Fluttertoast.showToast(
              msg: "Congratulations, you are logged-in successfully.");

          User userInfo = User.fromJson(resBodyOfLogin["userData"]);

          //save Userinfo to local storage
          await RememberUserPrefs.saveRememberUser(userInfo);

          Get.to(DashboardOfFragments());

        } else {
          Fluttertoast.showToast(msg: "Incorrect Credentials. \nPlease write correct password or email and Try Again.");
        }
      }
    }
    catch(errorMsg)
    {
      print("Error :: " + errorMsg.toString());

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  color: Colors.blue[900],
                  child: Padding(
                    padding: const EdgeInsets.all(90.0),
                    child: Text(
                      'Blnk',
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 70,),
                    ),
                  ),
                ),
                //Hello Again!
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Log in to your account',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.blue[900]),
                ),
                SizedBox(
                  height: 20,
                ),

                //email textfield


                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Form(
                    key: formKey,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an email address.';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'E-mail',
                            prefixIcon: Icon(Icons.mail),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //password text field
                Obx(
                      ()=> Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: isObsecure.value,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password.';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                            prefixIcon: Icon(Icons.lock),
                          ),
                        ),
                      ),
                    ),
                  ),

                ),


                SizedBox(
                  height: 30,
                ),

                //log in button

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 120.0),
                  child: GestureDetector(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        loginUserNow();
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.blue[900],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Log In',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),


                SizedBox(
                  height: 15,
                ),
                Text('-Or-',style:TextStyle(fontWeight: FontWeight.bold),),

                SizedBox(
                  height: 20,
                ),
                //not a member? register button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dont have an account?',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue[900]),
                    ),

                  ],
                ),


                TextButton(
                  onPressed: () {
                    Get.to(SigninPage());
                  },
                  child: const Text(
                    "SigUp Here",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}