import 'package:flutter/material.dart';
import 'package:project_1/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController password_Controller = TextEditingController();
  bool _isObscure = true;
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Image.asset(
                "asset/Logo.png",
                height: 100,
                width: 100,
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "SHOW",
                style: TextStyle(
                  color: Color(0xff1A6350),
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Create your account",
                style: TextStyle(
                  color: Color(0xff1A6350),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              EmailText(
                  Icons.email, "Enter Your E-mail", "Email", nameController),
              SizedBox(
                height: 32,
              ),
              Textfild(Icons.lock, "Enter Your Password", "Password",
                  Icons.visibility, passwordController, true),
              SizedBox(
                height: 20,
              ),
              Textfild(Icons.lock, "Confirm Your Password", "Password",
                  Icons.visibility, password_Controller, true),
              SizedBox(
                height: 20,
              ),
              OutlinedButton(
                onPressed: () {},
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.white54,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Color(0xff1A6350),
                  primary: Colors.white,
                  //  fixedSize: Size(200, 60),
                  side: BorderSide(
                    width: 3,
                    color: Color(0xff1A6350),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "or Sign In with",
                style: TextStyle(
                  color: Color(0xff1A6350),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageIcon(
                    AssetImage("asset/google.png"),
                    size: 30,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  ImageIcon(
                    AssetImage("asset/facebook.png"),
                    size: 30,
                    color: Colors.blue[300],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  ImageIcon(
                    AssetImage("asset/twitter.png"),
                    size: 30,
                    color: Colors.blue[300],
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already Have an Account?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: Color(0xff1A6350),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
