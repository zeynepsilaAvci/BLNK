import 'package:deneme2/users/authentication/sign_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  Future logIn() async{
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
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'E-mail',
                          prefixIcon: Icon(Icons.mail),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //password text field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                          prefixIcon: Icon(Icons.lock),
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
                    onTap: logIn,
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
                              fontSize: 18),
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
